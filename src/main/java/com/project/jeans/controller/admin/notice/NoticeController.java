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

    //공지사항 전체목록 불러오기
    @GetMapping("/noticeList")
    public ModelAndView noticeList() {
        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("notice/noticeList"); // JSP 파일명(user.jsp)
        modelAndView.addObject("noticeList", noticeList); // "noticeList"라는 이름으로 데이터 전달

        return modelAndView;
    }

    //공지사항 Insert
    @GetMapping("/noticeInsert")
    public ModelAndView noticeInsert(){
        return new ModelAndView("notice/noticeInsert");
    }

    //공지사항 Insert-insert ajax
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
    //공지사항 상세보기
    @GetMapping("/noticeDetail")
    public ModelAndView noticeDetail(){
        return new ModelAndView("notice/noticeDetail");
    }

    //공지사항 게시글 ishshow 'N'처리
    @PostMapping("/noticeIsshow")
    public int noticeIsshow(@RequestParam("notice_no") int notice_no){
        System.out.println("ishshow컨트롤러 진입");
        return noticeDAO.noticeIsshow(notice_no);
    }

    @GetMapping("/test")
    public ModelAndView test(){
        return new ModelAndView("test");
    }
}