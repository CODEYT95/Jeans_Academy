package com.project.jeans.controller.main;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.admin.notice.NoticeServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;

@Controller
public class mainController {

    private final NoticeService noticeService;

    public mainController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
    @GetMapping("/main1")
    public String main(Model model) {
        List<NoticeDTO> recentNotices = noticeService.selectFive();
        HashMap<String, NoticeDTO> noticeMap = new HashMap<>();

        for (int i = 0; i < recentNotices.size(); i++) {
            String attributeName = "notice" + (i + 1);
            noticeMap.put(attributeName, recentNotices.get(i));
        }

        model.addAttribute("noticeMap", noticeMap);
        return "main/main";
    }

}
