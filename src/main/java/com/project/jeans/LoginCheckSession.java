package com.project.jeans;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

public class LoginCheckSession {
    private final MemberService memberService;

    public LoginCheckSession(MemberService memberService) {
        this.memberService = memberService;
    }

    public MemberDTO getLoginCheckSession(HttpSession session, Model model) {
        String member_id = (String) session.getAttribute("member_id");
        if (member_id == null) {
            // 세션이 만료되었거나 로그인되지 않았을 경우 로그인 페이지로 리디렉션
            return null;
        }

        MemberDTO memberInfo = memberService.getMemberInfo(member_id);
        if (memberInfo != null) {
            String member_name = memberInfo.getMember_name();
            String member_class = memberInfo.getMember_class();
            String member_type = memberInfo.getMember_type();
            model.addAttribute("member_name", member_name);
            model.addAttribute("member_class", member_class);
            model.addAttribute("member_type", member_type);
        }
        return memberInfo;
    }
}