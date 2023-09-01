package com.project.jeans.controller.member;

import com.project.jeans.domain.member.dao.MemberDAO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.xml.transform.Result;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class LoginController {

    @Autowired
    private MemberService memberService;
    private MemberDAO memberDAO;

    //로그인 폼 보여주기
    @RequestMapping("/login")
    public String login(){
        return "member/login";
    }
    //로그인 처리
    @PostMapping("/login")
    public int loginMember(@RequestParam String member_id,
                              @RequestParam String member_pw,
                              @RequestParam String member_type,
                              HttpSession session,
                              Model model) {
        try {
            String type = memberService.memberType(member_id);
            if (type == null) {
                // 타입이 null일 경우 예외 처리
                throw new IllegalArgumentException("Unknown member type");
            }

            String pattern = "관리자|강사님";
            System.out.println(type);

            Pattern p = Pattern.compile(pattern);
            Matcher m = p.matcher(type);

            MemberDTO memberDTO = new MemberDTO();
            int result = 0;
            System.out.println("로그인처리 컨트롤러 진입 성공");
            memberDTO.setMember_id(member_id);
            memberDTO.setMember_pw(member_pw);
            memberDTO.setMember_type(member_type);
            System.out.println(member_id + member_pw + member_type);
            if (type.equals("수강생")) {
                System.out.println("수강생 if절");
                result = memberService.loginStudent(memberDTO);
            } else if (m.find()) {
                System.out.println("강사/관리자 if절");
                result = memberService.loginTeacher(memberDTO);
            }
            System.out.println("result값 ==" + result);
            return result; // int를 String으로 변환하여 반환
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 로직 추가 (예: 로그 기록, 사용자에게 오류 메시지 표시 등)
            return 4; // 예외 발생 시 에러 페이지로 리다이렉트하거나 다른 적절한 값 반환
        }
    }


    //로그인 유효성 검사
}
