package com.project.jeans.controller.admin.notice;

import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
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
    private final MemberService memberService;

    @GetMapping("/noticeList")
    public ModelAndView noticeList(Model model, HttpSession session) {
        String member_id = (String) session.getAttribute("member_id");

        if (member_id == null) {
            // 세션이 만료되었거나 로그인되지 않았을 경우 로그인 페이지로 리디렉션
            return new ModelAndView("redirect:/login");
        }

        MemberDTO memberInfo = memberService.getMemberInfo(member_id);
        if (memberInfo != null) {
            String member_name = memberInfo.getMember_name();
            String member_class = memberInfo.getMember_class();

            model.addAttribute("member_name", member_name);
            model.addAttribute("member_class", member_class);
        }
        List<NoticeDTO> noticeList = noticeService.selectAll();

        ModelAndView modelAndView = new ModelAndView("notice/noticeList");
        modelAndView.addObject("noticeList", noticeList);

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


    @GetMapping("/list")
    public String getNoticeList(Model model){
        List<NoticeDTO> board1DTOList = noticeService.getNoticeList();
        model.addAttribute("noticeList", board1DTOList);
        return "/notice/noticeList";
    }
}