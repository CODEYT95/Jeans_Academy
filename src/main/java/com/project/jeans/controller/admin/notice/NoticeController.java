package com.project.jeans.controller.admin.notice;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;
    private final NoticeDAO noticeDAO;
    private final MemberService memberService;

    //공지사항 조회
    @GetMapping("/noticeList")
    public ModelAndView noticeList(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("notice/noticeList"); // JSP 파일명(user.jsp)
        modelAndView.addObject("noticeList", noticeList); // "noticeList"라는 이름으로 데이터 전달

        return modelAndView;
    }

    @GetMapping("/noticeDetail/{notice_no}")
    public String noticeDetail(@PathVariable("notice_no") int noticeNo, Model model, HttpSession session) {

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        System.out.println(noticeNo);
        NoticeDTO noticeDTO = noticeService.noticeDetail(noticeNo);

        // 공지사항 정보를 모델에 추가합니다.
        model.addAttribute("noticeDTO", noticeDTO);
        return "notice/noticeDetail";
    }


    //공지사항 입력
    @GetMapping("/noticeInsert")
    public ModelAndView noticeInsert(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService); // Provide the memberService instance here
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        return new ModelAndView("notice/noticeInsert");
    }

    @PostMapping("/notice_insert")
    public NoticeDTO notice_insert(@RequestParam("title") String title, @RequestParam("content") String content,
                                                            HttpSession session, Model model){

        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setNotice_title(title);
        noticeDTO.setNotice_content(content);
        noticeDTO.setMember_name("관리자 윤지");
        noticeDTO.setMember_class("1반");

        noticeDAO.insertNotice(noticeDTO);

        return noticeDTO;
    }

    //공지사항 isshow 'N'으로 바꾸기
    public int isShowNotice(){
    return 0;
    }
}