package com.project.jeans.controller.board.board4;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
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
    private final NoticeDAO noticeService;

    //(주의) 관리자, 작성자만 UD할 수 있도록 수정해야 함!!!


    //반별 게시판 목록 조회
    @GetMapping("/list")
    public String getBoard2List(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());

        List<Board4DTO> board4DTOList = board4Service.getBoard4List();
        List<NoticeDTO> noticeList = noticeService.selectAll();

        model.addAttribute("board4List", board4DTOList);
        model.addAttribute("noticeList", noticeList);

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
        System.out.println(memberInfo.getMember_id());
        model.addAttribute("member_id", memberInfo.getMember_id());
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());

        return "/board/board4/board4Write";
    }

    /* member_name, member_class 연동되면 삭제할 예정*/
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

        model.addAttribute("member_id", memberInfo.getMember_id());
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:member/login";
        }

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

        int deletedBoard4Int = board4Service.deleteBoard4(map);
        if (deletedBoard4Int == 1) {
            modelAndView.setViewName("redirect:/board4/list");
        } else {
            modelAndView.setViewName("redirect:/board4/list");
        }
        return modelAndView;
    }

}