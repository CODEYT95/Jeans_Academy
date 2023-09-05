package com.project.jeans.controller.admin.notice;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class NoticeController {
    private final MemberService memberService;
    private final NoticeService noticeService;
    private final NoticeDAO noticeDAO;

    //공지사항 조회
    @GetMapping("/noticeList")
    public ModelAndView noticeList(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("notice/noticeList"); // JSP 파일명(user.jsp)
        modelAndView.addObject("noticeList", noticeList); // "noticeList"라는 이름으로 데이터 전달

        return modelAndView;
    }

    @GetMapping("/noticeDetail")
    public ModelAndView noticeDetail(@RequestParam("notice_no") int noticeNo) {
        System.out.println(noticeNo);
        ModelAndView modelAndView = new ModelAndView("notice/noticeDetail");
        // 공지 번호를 뷰에서 사용하기 위해 모델에 추가합니다.
        modelAndView.addObject("noticeNo", noticeNo);
        // MyBatis를 사용하여 데이터베이스에서 데이터를 검색합니다.
        List<NoticeDTO> noticeDetail = noticeDAO.noticeDetail(noticeNo);
        // 검색된 데이터를 뷰에서 사용하기 위해 모델에 추가합니다.
        modelAndView.addObject("noticeDetail", noticeDetail);
        return modelAndView;
    }


    //공지사항 입력
    @GetMapping("/noticeInsert")
    public ModelAndView noticeInsert(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService); // Provide the memberService instance here
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        return new ModelAndView("notice/noticeInsert");
    }

    @PostMapping("/notice_insert")
    public NoticeDTO notice_insert(@RequestParam("title") String title, @RequestParam("content") String content){

        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setNotice_title(title);
        noticeDTO.setNotice_content(content);
        noticeDTO.setMember_name("Test");
        noticeDTO.setMember_class("1반");

        noticeDAO.insertNotice(noticeDTO);

        return noticeDTO;
    }

    //공지사항 isshow 'N'으로 바꾸기
    public int isShowNotice(){
    return 0;
    }
}