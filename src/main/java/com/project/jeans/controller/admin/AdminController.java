package com.project.jeans.controller.admin;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.common.paging.dto.PageCreate;
import com.project.jeans.domain.common.paging.dto.PageDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/admin/memberList")
    public String selectMember(PageDTO pageDTO, Model model, HttpSession session) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        String category = "admin";
        model.addAttribute("category", category);
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        PageCreate pageCreate  = new PageCreate();
        pageCreate.setPaging(pageDTO);
        pageCreate.setArticleTotalCount(memberService.getShowMemberCount(pageDTO));

        PageCreate pageCreateHidden = new PageCreate();
        pageCreateHidden.setPaging(pageDTO);
        pageCreateHidden.setArticleTotalCount(memberService.getHiddenMemberCount(pageDTO));

        PageCreate pageCreateAccept = new PageCreate();
        pageCreateAccept.setPaging(pageDTO);
        pageCreateAccept.setArticleTotalCount(memberService.getNoAcceptMemberCount(pageDTO));


        //목록 조회
        List<MemberDTO> showMembers = memberService.getShowMember(pageDTO);
        List<MemberDTO> hiddenMembers = memberService.getHiddenMember(pageDTO);
        List<MemberDTO> acceptMembers = memberService.getNoAcceptMember(pageDTO);

        //페이징
        model.addAttribute("showMembers", showMembers);
        model.addAttribute("pageCreate",pageCreate);

        model.addAttribute("hiddenMembers", hiddenMembers);
        model.addAttribute("pageCreateHidden", pageCreateHidden);

        model.addAttribute("acceptMembers", acceptMembers);
        model.addAttribute("pageCreateAccept", pageCreateAccept);
        return "admin/memberList";
    }

}
