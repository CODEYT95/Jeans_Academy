package com.project.jeans.controller.board.board4;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/board4")
@Controller
@RequiredArgsConstructor
public class Board4Controller {

    private final MemberService memberService;
    @GetMapping("/list")
    public String board1List(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "member/login";
        }

        System.out.println("수정중(git에서 수정)");
        return "/board4/board4List";
    }



}
