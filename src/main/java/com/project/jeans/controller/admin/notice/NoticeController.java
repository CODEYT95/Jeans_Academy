package com.project.jeans.controller.admin.notice;

import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;
    private final NoticeDAO noticeDAO;

    @GetMapping("/noticeList")
    public ModelAndView noticeList() {
        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("notice/noticeList"); // JSP 파일명(user.jsp)
        modelAndView.addObject("noticeList", noticeList); // "noticeList"라는 이름으로 데이터 전달

        return modelAndView;
    }

    @GetMapping("/noticeInsert")
    public ModelAndView noticeInsert(){
        return new ModelAndView("notice/noticeInsert");
    }

    @GetMapping("/noticeDetail")
    public ModelAndView noticeDetail(){
        return new ModelAndView("notice/noticeDetail");
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

    @GetMapping("/test")
    public ModelAndView test(){
        return new ModelAndView("notice/abc");
    }
}