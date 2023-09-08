package com.project.jeans.controller.admin;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.common.paging.dto.PageDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/admin/memberList")
    public String selectMember(@RequestParam(value = "page", defaultValue = "1") int page,
                                                    @RequestParam(value = "size", defaultValue = "2") int size,
                                                    Model model, HttpSession session) {

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        String category = "admin";
        model.addAttribute("category", category);
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());

        // Get total count of members
        int totalMemberCount = memberService.getShowMemberCount();

        // Calculate the total number of pages
        int totalPages = (int) Math.ceil((double) totalMemberCount / size);

        // Ensure the requested page is within valid bounds
        page = Math.min(Math.max(1, page), totalPages);

        // Get a page of members
        List<MemberDTO> memberList = memberService.getShowMember(page, size);

        // Create a PageDTO to hold pagination information
        PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, memberList);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("nowPage",page);

        return "admin/memberList";
    }

}
