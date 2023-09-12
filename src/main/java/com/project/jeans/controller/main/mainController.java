package com.project.jeans.controller.main;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board2.dto.Board2DTO;
import com.project.jeans.domain.board.board3.dto.Board3DTO;
import com.project.jeans.domain.board.board4.dto.Board4DTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.admin.notice.NoticeService;
import com.project.jeans.service.board.board1.Board1Service;
import com.project.jeans.service.board.board2.Board2Service;
import com.project.jeans.service.board.board3.Board3Service;
import com.project.jeans.service.board.board4.Board4Service;
import com.project.jeans.service.calendar.CalendarService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class mainController {

    private final NoticeService noticeService;
    private final MemberService memberService;
    private final Board1Service board1Service;
    private final Board2Service board2Service;
    private final Board3Service board3Service;
    private final Board4Service board4Service;

    public mainController(NoticeService noticeService, CalendarService calendarService, MemberService memberService, Board1Service board1Service, Board2Service board2Service, Board3Service board3Service, Board4Service board4Service) {
        this.noticeService = noticeService;
        this.board2Service = board2Service;
        this.memberService = memberService;
        this.board1Service = board1Service;
        this.board3Service = board3Service;
        this.board4Service = board4Service;
    }
    @GetMapping("/main1")
    public String main(Model model, HttpSession session) {
        String member_id = (String) session.getAttribute("member_id");
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        String category = "main";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<NoticeDTO> noticeList = noticeService.selectFive();
        List<Board1DTO> board1List = board1Service.findBoard1List();
        List<Board2DTO> board2List = board2Service.findBoard2List();
        List<Board3DTO> board3List = board3Service.findBoard3List();
        List<Board4DTO> board4List = board4Service.findBoard4List();

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("board1List", board1List);
        model.addAttribute("board2List", board2List);
        model.addAttribute("board3List", board3List);
        model.addAttribute("board4List", board4List);

        return "main/main";

    }
}
