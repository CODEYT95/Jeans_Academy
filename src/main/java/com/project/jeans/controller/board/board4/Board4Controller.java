package com.project.jeans.controller.board.board4;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.board.board4.dto.Board4DTO;
import com.project.jeans.domain.board.board4.dto.Comment4DTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.board.board4.Board4Service;
import com.project.jeans.service.board.board4.Comment4Service;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RequestMapping("/board4")
@RequiredArgsConstructor
@Controller
public class Board4Controller {
    private final MemberService memberService;
    private final Board4Service board4Service;
    private final Comment4Service comment4Service;

    //반별 게시판 목록 조회
    @GetMapping("/list")
    public String getBoard2List(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return "/main/main";
        }

        String category = "board4";
        model.addAttribute("category", category);
        model.addAttribute("member_id", memberInfo.getMember_id());
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<Board4DTO> board4DTOList = board4Service.getBoard4List();
        List<Board4DTO> board4DTOBYTutor = board4Service.findBoard4ByTutor();

        model.addAttribute("board4List", board4DTOList);
        model.addAttribute("board4DTOBYTutor", board4DTOBYTutor);

        return "/board/board4/board4List";
    }


    //반별 게시글 상세 조회 및 게시글 관련 댓글 조회
    //페이지 연결할 때 수정 가능성 있음
    @GetMapping("/detail/{board4_no}")
    public String readBoard4(@PathVariable("board4_no") int board4_no, HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return "/main/main";
        }

        String category = "board4";
        model.addAttribute("category", category);
        model.addAttribute("member_id", memberInfo.getMember_id());
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        Board4DTO board4DTO = board4Service.getBoard4Detail(board4_no);
        model.addAttribute("board4DTO", board4DTO);
        List<Comment4DTO> comment4DTO = comment4Service.getComment4List(board4_no);
        model.addAttribute("comment4DTO", comment4DTO);
        return "/board/board4/board4Detail";
    }

    //반별 게시글 작성(폼)
    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String writeBoard4Form(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return "/main/main";
        }

        String category = "board4";
        model.addAttribute("category", category);
        model.addAttribute("member_id", memberInfo.getMember_id());
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());

        return "/board/board4/board4Write";
    }

    //반별 게시글 작성(로직)
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public ModelAndView writeBoard4(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            System.out.println("테스트");
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/member/login");
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return  new ModelAndView("redirect:/main/main");
        }

        if(map.isEmpty()){
            return new ModelAndView("redirect:/board4/list");
        }
        if (map.get("board4_title") == "" || map.get("board4_title") == null){
            return new ModelAndView("redirect:/board4/list");
        }
        if (map.get("board4_content") == "" || map.get("board4_content") == null){
            return new ModelAndView("redirect:/board4/list");
        }

        int writeInt = board4Service.writeBoard4(map);
        if (writeInt == 1) {
            modelAndView.setViewName("redirect:/board4/list");
        } else {
            modelAndView.setViewName("redirect:/board4/write");
        }
        return modelAndView;
    }

    //반별 게시글 수정(폼)
    @GetMapping("/modify")
    public String modifyBoard1Form(@RequestParam int board4_no, Model model, HttpSession session) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:member/login";
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return "/main/main";
        }

        String category = "board4";
        model.addAttribute("category", category);
        model.addAttribute("member_id", memberInfo.getMember_id());
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());

        Board4DTO board4DTO = board4Service.getBoard4Detail(board4_no);
        model.addAttribute("board4DTO", board4DTO);
        return "/board/board4/board4Modify";
    }

    //반별 게시글 수정
    @PostMapping("/modify")
    public ModelAndView modifyBoard4(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam int board4_no, @RequestParam Map<String, Object> map) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return  new ModelAndView("redirect:/main/main");
        }

        int modifyInt = board4Service.modifyBoard4(map);
        if (modifyInt == 1) {
            modelAndView.setViewName("redirect:/board4/detail/" + board4_no);
        } else {
            modelAndView.setViewName("redirect:/board4/list");
        }
        return modelAndView;
    }

    //반별 게시글 삭제
    @GetMapping("/delete")
    public ModelAndView deleteBoard4(HttpSession session, Model model, ModelAndView modelAndView,
                                     @RequestParam Map<String, Object> map) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        String memberClass = memberInfo.getMember_class();
        String memberType = memberInfo.getMember_type();
        if (!memberClass.equals("4반") && memberType.equals("수강생")) {
            return  new ModelAndView("redirect:/main/main");
        }

        if(map.isEmpty()){
            return new ModelAndView("redirect:/board4/list");
        }
        if (map.get("board4_title") == "" || map.get("board4_title") == null){
            return new ModelAndView("redirect:/board4/list");
        }
        if (map.get("board4_content") == "" || map.get("board4_content") == null){
            return new ModelAndView("redirect:/board4/list");
        }

        int deletedBoard4Int = board4Service.deleteBoard4(map);
        if (deletedBoard4Int == 1) {
            modelAndView.setViewName("redirect:/board4/list");
        } else {
            modelAndView.setViewName("redirect:/board4/list");
        }
        return modelAndView;
    }
}