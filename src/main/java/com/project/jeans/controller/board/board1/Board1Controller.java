package com.project.jeans.controller.board.board1;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board1.dto.Comment1DTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.board.board1.Board1Service;
import com.project.jeans.service.board.board1.Comment1ServiceImpl;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RequestMapping("/board1")
@RequiredArgsConstructor
@Controller
public class Board1Controller {
    private final MemberService memberService;
    private final Board1Service board1Service;
    private final Comment1ServiceImpl comment1ServiceImpl;

    //(주의) 관리자, 작성자만 UD할 수 있도록 수정해야 함!!!


    //반별 게시판 목록 조회
    @GetMapping("/list")
    public String getBoard1List(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<Board1DTO> board1DTOList = board1Service.getBoard1List();
        model.addAttribute("board1List", board1DTOList);
        return "/board/board1/board1List";
    }


    //반별 게시글 상세 조회 및 게시글 관련 댓글 조회
    //페이지 연결할 때 수정 가능성 있음
    @GetMapping("/detail/{board1_no}")
    public String readBoard1(@PathVariable("board1_no") int board1_no,HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        Board1DTO board1DTO = board1Service.getBoard1Detail(board1_no);
        model.addAttribute("board1DTO", board1DTO);
        List<Comment1DTO> comment1DTO = comment1ServiceImpl.getComment1List(board1_no);
        model.addAttribute("comment1DTO",comment1DTO);
        return "/board/board1/board1Detail";
    }

    //반별 게시글 작성(폼)
    @RequestMapping(value="/write", method=RequestMethod.GET)
    public String writeBoard1Form(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        return "/board/board1/board1Write";
    }

    /* member_name, member_class 연동되면 삭제할 예정*/
    //반별 게시글 작성(로직)
    @RequestMapping(value="/write", method=RequestMethod.POST)
    public ModelAndView writeBoard1(HttpSession session, Model model,ModelAndView modelAndView, @RequestParam Map<String,Object> map){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            System.out.println("테스트");
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/member/login");
        }

        int writeInt = board1Service.writeBoard1(map);
        if(writeInt==1){
            modelAndView.setViewName("redirect:/board1/list");
        }else {
            modelAndView.setViewName("redirect:/board1/write");
        }
        return modelAndView;
    }

    //반별 게시글 수정(폼)
    @GetMapping("/modify")
    public String modifyBoard1Form(@RequestParam int board1_no, Model model, HttpSession session){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:member/login";
        }

        Board1DTO board1DTO = board1Service.getBoard1Detail(board1_no);
        model.addAttribute("board1DTO", board1DTO);
        return "/board/board1/board1Modify";
    }

    //반별 게시글 수정
    @PostMapping("/modify")
    public ModelAndView modifyBoard1(HttpSession session, Model model,ModelAndView modelAndView, @RequestParam int board1_no, @RequestParam Map<String,Object> map){

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        int modifyInt = board1Service.modifyBoard1(map);
        if(modifyInt==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/list");
        }
        return modelAndView;
    }


    //반별 게시글 삭제
    @GetMapping("/delete")
    public ModelAndView deleteBoard1(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String,Object> map){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        System.out.println(map);
        int deletetInt = board1Service.deleteBoard1(map);
        if(deletetInt==1){
            modelAndView.setViewName("redirect:/board1/list");
        }else {
            modelAndView.setViewName("redirect:/board1/list");
        }
        return modelAndView;
    }

    /* 진호 구현 */
/*
    //반별 게시글 수정(폼)
    @GetMapping("/board1modify")
    public Board1DTO Modify(){
        return board1Service.board1Modify();
    }

    //반별 게시글 수정
    @PostMapping("/Modify")
    public Board1DTO Board1Modify(){
        return board1Service.board1Modify();
    }

    //반별 게시글 삭제
    @GetMapping("/board1Delete")
    public String board1Delete(){
        board1Service.board1Delete();
        return "redirect:/board1/list";
    }
*/
    //수빈언니 확인용 컨트롤러 지우지말 것!
    @RequestMapping("/board1.do")
    public String board1(){
        return "board/board1/board1List";
    }
}