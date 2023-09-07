package com.project.jeans.controller.board.board2;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.board.board2.dto.Board2DTO;
import com.project.jeans.domain.board.board2.dto.Comment2DTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.board.board2.Board2Service;
import com.project.jeans.service.board.board2.Comment2Service;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RequestMapping("/board2")
@RequiredArgsConstructor
@Controller
public class Board2Controller {
    private final MemberService memberService;
    private final Board2Service board2Service;
    private final Comment2Service comment2Service;
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

        List<Board2DTO> board2DTOList = board2Service.getBoard2List();
        List<NoticeDTO> noticeList = noticeService.selectAll();

        model.addAttribute("board2List", board2DTOList);
        model.addAttribute("noticeList", noticeList);

        return "/board/board2/board2List";
    }


    //반별 게시글 상세 조회 및 게시글 관련 댓글 조회
    //페이지 연결할 때 수정 가능성 있음
    @GetMapping("/detail/{board2_no}")
    public String readBoard2(@PathVariable("board2_no") int board2_no, HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        Board2DTO board2DTO = board2Service.getBoard2Detail(board2_no);
        model.addAttribute("board2DTO", board2DTO);
        List<Comment2DTO> comment2DTO = comment2Service.getComment2List(board2_no);
        model.addAttribute("comment2DTO", comment2DTO);
        return "/board/board2/board2Detail";
    }

    //반별 게시글 작성(폼)
    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String writeBoard2Form(HttpSession session, Model model) {
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

        return "/board/board2/board2Write";
    }

    /* member_name, member_class 연동되면 삭제할 예정*/
    //반별 게시글 작성(로직)
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public ModelAndView writeBoard2(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            System.out.println("테스트");
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/member/login");
        }

        int writeInt = board2Service.writeBoard2(map);
        if (writeInt == 1) {
            modelAndView.setViewName("redirect:/board2/list");
        } else {
            modelAndView.setViewName("redirect:/board2/write");
        }
        return modelAndView;
    }

    //반별 게시글 수정(폼)
    @GetMapping("/modify")
    public String modifyBoard1Form(@RequestParam int board2_no, Model model, HttpSession session) {
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

        Board2DTO board2DTO = board2Service.getBoard2Detail(board2_no);
        model.addAttribute("board2DTO", board2DTO);
        return "/board/board2/board2Modify";
    }

    //반별 게시글 수정
    @PostMapping("/modify")
    public ModelAndView modifyBoard2(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam int board2_no, @RequestParam Map<String, Object> map) {

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        int modifyInt = board2Service.modifyBoard2(map);
        if (modifyInt == 1) {
            modelAndView.setViewName("redirect:/board2/detail/" + board2_no);
        } else {
            modelAndView.setViewName("redirect:/board2/list");
        }
        return modelAndView;
    }


    //반별 게시글 삭제
    @GetMapping("/delete")
    public ModelAndView deleteBoard2(HttpSession session, Model model, ModelAndView modelAndView,
                                     @RequestParam Map<String, Object> map) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        int deletedBoard2Int = board2Service.deleteBoard2(map);
        if (deletedBoard2Int == 1) {
            modelAndView.setViewName("redirect:/board2/list");
        } else {
            modelAndView.setViewName("redirect:/board2/list");
        }
        return modelAndView;
    }

}