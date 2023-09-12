package com.project.jeans.controller.admin;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.common.paging.dto.PageDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import com.sun.net.httpserver.Authenticator;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.transform.Result;
import java.util.List;
import java.util.zip.Inflater;

@Controller
public class AdminController {
    @Autowired
    private MemberService memberService;

    //현재회원 목록 조회
    @GetMapping("/admin/memberList")
    public String memberList(@RequestParam(value = "page", defaultValue = "1") int page,
                                                @RequestParam(value = "size", defaultValue = "7") int size,
                                                @RequestParam(value = "keyword", required = false) String keyword,
                                                @RequestParam(value = "condition", required = false) String condition,
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

        Integer noAcceptMemberCount = memberService.getNoAcceptMemberCount();
        model.addAttribute("noAcceptMemberCount", noAcceptMemberCount);


        if (keyword != null && condition != null) {
            model.addAttribute("keyword", keyword);
            model.addAttribute("condition", condition);
            model.addAttribute("currentPage", page);
            // 수정된 부분: 검색 결과에 따른 totalMemberCount를 가져옵니다.
            int totalMemberCount = memberService.getShowMemberCountWithSearch(condition, keyword);
            List<MemberDTO> searchResults = memberService.getShowMember(page, size, condition, keyword);

            PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, searchResults);
            model.addAttribute("searchResults", searchResults);
            model.addAttribute("pageDTO", pageDTO);
        } else {
            // 검색 조건이 없는 경우 전체 회원 목록을 가져옵니다.
            int totalMemberCount = memberService.getShowMemberCount();
            int totalPages = (int) Math.ceil((double) totalMemberCount / size);
            page = Math.min(Math.max(1, page), totalPages);

            List<MemberDTO> memberList = memberService.getShowMember(page, size, null, null);

            PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, memberList);
            model.addAttribute("pageDTO", pageDTO);
        }

        return "admin/memberList";
    }

    //isshow Y -> N 변경
    @GetMapping("/updateMember")
    @ResponseBody
    public int updateMember (@RequestParam String member_id){
        int result = memberService.updateMember(member_id);
        if(result == 1){
            return 1;
        }else{
            return 0;
        }
    }

    //isshow N -> Y 변경
    @GetMapping("/refreshMember")
    @ResponseBody
    public int refreshMember (@RequestParam String member_id){
        int result = memberService.refreshMember(member_id);
        if(result == 1){
            return 1;
        }else{
            return 0;
        }
    }

    //회원 정보 수정
    @PostMapping(value = "/modifyMember")
    @ResponseBody
    public String modifyMember(@RequestParam("member_id") String member_id,
                               @RequestParam("member_name") String member_name,
                               @RequestParam("member_phone") String member_phone,
                               @RequestParam("member_class") String member_class){
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMember_id(member_id);
        memberDTO.setMember_name(member_name);
        memberDTO.setMember_phone(member_phone);
        memberDTO.setMember_class(member_class);

        String checkPhone = memberService.phoneDuplicate(member_phone);

        if(checkPhone.equals("available")){
            int result = memberService.modifyMemberInfo(memberDTO);
            if(result == 1){

                return "success";
            }else {
                return "failed";
            }
        }else{
            return "duplicate";
        }
    }

    //요청 목록
    @GetMapping("/admin/acceptList")
    public String acceptList(@RequestParam(value = "page", defaultValue = "1") int page,
                                                @RequestParam(value = "size", defaultValue = "7") int size,
                                                @RequestParam(value = "keyword", required = false) String keyword,
                                                @RequestParam(value = "condition", required = false) String condition,
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

        Integer noAcceptMemberCount = memberService.getNoAcceptMemberCount();
        model.addAttribute("noAcceptMemberCount", noAcceptMemberCount);

        if (keyword != null && condition != null) {
            model.addAttribute("keyword", keyword);
            model.addAttribute("condition", condition);
            model.addAttribute("currentPage", page);
            // 수정된 부분: 검색 결과에 따른 totalMemberCount를 가져옵니다.
            int totalMemberCount = memberService.getNoAcceptMemberCountWithSearch(condition, keyword);
            List<MemberDTO> searchResults = memberService.getNoAcceptMember(page, size, condition, keyword);

            PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, searchResults);
            model.addAttribute("searchResults", searchResults);
            model.addAttribute("pageDTO", pageDTO);
        } else {
            // 검색 조건이 없는 경우 전체 회원 목록을 가져옵니다.
            int totalMemberCount = memberService.getNoAcceptMemberCount();
            int totalPages = (int) Math.ceil((double) totalMemberCount / size);
            page = Math.min(Math.max(1, page), totalPages);

            List<MemberDTO> memberList = memberService.getNoAcceptMember(page, size, null, null);

            PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, memberList);
            model.addAttribute("pageDTO", pageDTO);
        }

        return "admin/acceptList";
    }

    //요청 수락 accept : N -> Y
    @GetMapping("/acceptUpdate")
    @ResponseBody
    public int updateAccept(@RequestParam String member_id){
        int result = memberService.acceptMember(member_id);
        if(result == 1){
            return 1;
        }else{
            return 0;
        }
    }

    @GetMapping("/admin/hiddenList")
    public String hiddenList(@RequestParam(value = "page", defaultValue = "1") int page,
                                                @RequestParam(value = "size", defaultValue = "7") int size,
                                                @RequestParam(value = "keyword", required = false) String keyword,
                                                @RequestParam(value = "condition", required = false) String condition,
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

        Integer noAcceptMemberCount = memberService.getNoAcceptMemberCount();
        model.addAttribute("noAcceptMemberCount", noAcceptMemberCount);

        if (keyword != null && condition != null) {
            model.addAttribute("keyword", keyword);
            model.addAttribute("condition", condition);
            model.addAttribute("currentPage", page);
            // 수정된 부분: 검색 결과에 따른 totalMemberCount를 가져옵니다.
            int totalMemberCount = memberService.getHiddenMemberCountWithSearch(condition, keyword);
            List<MemberDTO> searchResults = memberService.getHiddenMember(page, size, condition, keyword);

            PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, searchResults);
            model.addAttribute("searchResults", searchResults);
            model.addAttribute("pageDTO", pageDTO);
        } else {
            // 검색 조건이 없는 경우 전체 회원 목록을 가져옵니다.
            int totalMemberCount = memberService.getHiddenMemberCount();
            int totalPages = (int) Math.ceil((double) totalMemberCount / size);
            page = Math.min(Math.max(1, page), totalPages);

            List<MemberDTO> memberList = memberService.getHiddenMember(page, size, null, null);

            PageDTO pageDTO = new PageDTO(totalMemberCount, page, size, memberList);
            model.addAttribute("pageDTO", pageDTO);
        }

        return "admin/hiddenList";
    }

    //회원 완전 삭제
    @GetMapping("deleteMember")
    @ResponseBody
    public int deleteMember(@RequestParam String member_id){
        int result = memberService.deleteMember(member_id);
        if(result == 1){
            return 1;
        }else{
            return 0;
        }
    }

}
