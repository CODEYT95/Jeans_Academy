package com.project.jeans.controller.main;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.calendar.CalendarService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {

    private final NoticeService noticeService;
    private  final CalendarService calendarService;
    private final MemberService memberService;

    public mainController(NoticeService noticeService, CalendarService calendarService, MemberService memberService) {
        this.noticeService = noticeService;
        this.calendarService = calendarService;
        this.memberService = memberService;
    }
    @GetMapping("/main1")
    public String main(Model model, HttpSession session) {
        String member_id = (String) session.getAttribute("member_id");
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "member/login";
        }

        memberInfo = memberService.getMemberInfo(member_id);
        if(memberInfo != null){
            String member_name = memberInfo.getMember_name();
            String member_class = memberInfo.getMember_class();

            model.addAttribute("member_name", member_name);
            model.addAttribute("member_class", member_class);
        }
        /*
        List<NoticeDTO> recentNotices = noticeService.selectFive();
        calendarService.selectCalendar(member_id);

        if (recentNotices.size() >= 1) {
            model.addAttribute("notice1", recentNotices.get(0));
        }
        if (recentNotices.size() >= 2) {
            model.addAttribute("notice2", recentNotices.get(1));
        }
        if (recentNotices.size() >= 3) {
            model.addAttribute("notice3", recentNotices.get(2));
        }
        if (recentNotices.size() >= 4) {
            model.addAttribute("notice4", recentNotices.get(3));
        }
        if (recentNotices.size() >= 5) {
            model.addAttribute("notice5", recentNotices.get(4));
        }
*/
        return "main/main";

    }
}
