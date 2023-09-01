package com.project.jeans.controller.member;

import com.project.jeans.domain.member.dao.MemberDAO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.eclipse.tags.shaded.org.apache.bcel.generic.RETURN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.transform.Result;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class LoginController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private MemberDAO memberDAO;

    //로그인 폼 보여주기
    @RequestMapping("/login")
    public String login() {
        return "member/login";
    }

    //로그인 처리
    @PostMapping("/login")
    @ResponseBody
    public int loginMember(@RequestParam String member_id,
                           @RequestParam String member_pw,
                           @RequestParam String member_type,
                           HttpSession session,
                           Model model) {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMember_id(member_id);
        memberDTO.setMember_pw(member_pw);
        memberDTO.setMember_type(member_type);

        System.out.println(member_id + member_pw);
        String type = memberService.memberType(member_id);

        if(type == null || type.equals("")) {
            return 5;//회원이 존재하지 않음

        } else if (type.equals("강사님") || type.equals("관리자") && member_type.equals("강사님")) {
            int success = memberService.loginTeacher(memberDTO);
            if(success == 1){
                int result = memberService.noAccept(member_id);
                if(result == 1){
                    session.setAttribute("member_id", member_id);
                    return 1;//로그인 완료
                }else{
                    return 3;//회원가입 요청중
                }
            } else{
                return 4;//아이디나 비밀번호가 틀림
            }
        } else if(type.equals("수강생") && member_type.equals("수강생")){
            int success = memberService.loginStudent(memberDTO);
            if(success == 1){
                int result = memberService.noAccept(member_id);
                if(result == 1){
                    session.setAttribute("member_id", member_id);
                    return 1;//로그인 완료
                }else{
                    return 3;//회원가입 요청중
                }
            }else{
                return 4;//아이디나 비밀번호가 틀림
            }
        }
        return 2;//타입 불일치
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login"; // 로그아웃 후 보여지는 페이지
    }
}
