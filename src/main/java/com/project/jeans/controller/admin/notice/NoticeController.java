package com.project.jeans.controller.admin.notice;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        System.out.println(memberInfo.getMember_class());
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }
        String category = "notice";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        System.out.println(memberInfo.getMember_class());
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("admin/notice/noticeList"); // JSP 파일명(user.jsp)
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
        String category = "notice";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        System.out.println(noticeNo);
        noticeService.noticeCountUp(noticeNo);
        NoticeDTO noticeDetail = noticeService.noticeDetail(noticeNo);
        NoticeDTO nreplyDetail = noticeService.nreplyDetail(noticeNo);

        // 공지사항 정보를 모델에 추가합니다.
        model.addAttribute("noticeDetail", noticeDetail);
        model.addAttribute("nreplyDetail",nreplyDetail);
        return "admin/notice/noticeDetail";
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
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        return new ModelAndView("admin/notice/noticeInsert");
    }

    @PostMapping("/notice_insert")
    public String notice_insert(@RequestParam("title") String title, @RequestParam("content") String content,
                                                            HttpSession session, Model model){

        LoginCheckSession loginCheck = new LoginCheckSession(memberService); // Provide the memberService instance here
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "redirect:/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setMember_id(memberInfo.getMember_id());
        noticeDTO.setNotice_title(title);
        noticeDTO.setNotice_content(content);

        int result = noticeDAO.insertNotice(noticeDTO);

        if(result == 1){
            int notice_no = noticeService.recentWrite(memberInfo.getMember_id());
            System.out.println(notice_no);
            return "redirect:/noticeDetail/" + notice_no;
        }
        return "/notice_insert";
    }

    //공지사항 isshow 'N'으로 바꾸기
    public int isShowNotice(){
    return 0;
    }
}