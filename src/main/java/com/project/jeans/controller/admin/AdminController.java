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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/admin/memberList")
    public String selectMember(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, Model model, HttpSession session) {

        // 페이지 번호가 1 이상인 경우에만 데이터 조회
        // 페이지 번호와 페이지 당 항목 수를 PageDTO에 설정
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPageNum(pageNum);

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

        // 목록 조회
        List<MemberDTO> showMembers = memberService.getShowMember(pageDTO);

        // 각 페이지별 페이징 처리를 위한 PageCreate 객체 생성 및 설정
        PageCreate pageCreateShow = new PageCreate();
        pageCreateShow.setPaging(pageDTO);
        pageCreateShow.setArticleTotalCount(memberService.getShowMemberCount(pageDTO));

        // 각 페이지별 모델에 추가
        model.addAttribute("showMembers", showMembers);
        model.addAttribute("pageCreateShow", pageCreateShow);

        return "admin/memberList";
    }
    @PostMapping("/admin/memberList")
    @ResponseBody // 응답 데이터를 HTTP Response Body에 직접 작성
    public Map<String, Object> selectMember2(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, Model model, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        // 페이지 당 항목 수
        int countPerPage = 5;

        // 페이지 번호가 1 이상인 경우에만 데이터 조회
        if (pageNum >= 1) {
            // 페이지 번호와 페이지 당 항목 수를 PageDTO에 설정
            PageDTO pageDTO = new PageDTO();
            pageDTO.setPageNum(pageNum*countPerPage);
            pageDTO.setCountPerPage(countPerPage);

            LoginCheckSession loginCheck = new LoginCheckSession(memberService);
            MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
            if (memberInfo == null) {
                // 로그인이 필요한 경우 리디렉션
                response.put("redirect", "/member/login");
                return response;
            }
            String category = "admin";
            model.addAttribute("category", category);
            model.addAttribute("member_name", memberInfo.getMember_name());
            model.addAttribute("member_class", memberInfo.getMember_class());
            model.addAttribute("member_type", memberInfo.getMember_type());

            // 목록 조회
            List<MemberDTO> showMembers = memberService.getShowMember(pageDTO);

            // 각 페이지별 페이징 처리를 위한 PageCreate 객체 생성 및 설정
            PageCreate pageCreateShow = new PageCreate();
            pageCreateShow.setPaging(pageDTO);
            pageCreateShow.setArticleTotalCount(memberService.getShowMemberCount(pageDTO));

            // 각 페이지별 모델에 추가
            model.addAttribute("showMembers", showMembers);
            model.addAttribute("pageCreateShow", pageCreateShow);

            response.put("showMembers", showMembers);
            response.put("pageCreateShow", pageCreateShow);
        }

        return response;
    }
}