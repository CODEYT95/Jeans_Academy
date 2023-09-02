package com.project.jeans.controller.main;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.calendar.dto.CalendarDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.calendar.CalendarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class mainController {

    private final NoticeService noticeService;
    private  final CalendarService calendarService;

    public mainController(NoticeService noticeService, CalendarService calendarService) {
        this.noticeService = noticeService;
        this.calendarService = calendarService;
    }
    @GetMapping("/main1")
    public String main(Model model) {
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
