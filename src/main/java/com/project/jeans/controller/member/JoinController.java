package com.project.jeans.controller.member;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class JoinController {

    //날짜 데이터 형식 변환 코드
    @ControllerAdvice
    public class GlobalBindingInitializer {
        @InitBinder
        public void initBinder(WebDataBinder binder) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");
            dateFormat.setLenient(false);
            binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
        }
    }

    @Autowired
    private MemberService memberService;

    //강사님 회원가입 폼 보여주기
    @RequestMapping("/teacher")
    public String joinTeahcerForm(){
        return "member/teacherJoin";
    }

    //강사님 회원가입 처리
    @RequestMapping(value="/teacher", method= RequestMethod.POST)
    public ModelAndView joinTeacher(ModelAndView mv, MemberDTO memberDTO) {
        int insertTeacher = memberService.insertTeacher(memberDTO);
        if (insertTeacher == 1) {
            mv.setViewName("redirect:/login");
        } else {
            mv.setViewName("redirect:/member/teacherJoin");
        }
        return mv;
    }

    //수강생 회원가입 폼 보여주기
    @RequestMapping("/student")
    public String joinStudent(){
        return "member/memberJoin";
    }

    //수강생 회원가입 처리
    @RequestMapping(value="/student",method= RequestMethod.POST)
    public ModelAndView joinStudent(ModelAndView mv, MemberDTO memberDTO) {
        int insertTeacher = memberService.insertStudent(memberDTO);
        if (insertTeacher == 1) {
            mv.setViewName("redirect:/login");
        } else {
            mv.setViewName("redirect:/member/memberJoin");
        }
        return mv;
    }

    /* 유효성 관련 메소드--------------------------------------------------------------------------------*/
    //아이디 중복 체크
    @GetMapping("/idDuplicate")
    @ResponseBody
    public String checkIdDuplicate(@RequestParam String member_id) {
        int result = memberService.idDuplicate(member_id);
        if (result > 0) {
            return "duplicate"; // 아이디 중복
        } else {
            return "available"; // 아이디 사용 가능
        }
    }

    //전화번호 중복 체크
    @GetMapping("/phoneDuplicate")
    @ResponseBody
    public String phoneDuplicate(@RequestParam String member_phone) {
        return memberService.phoneDuplicate(member_phone);
    }

    //강사번호 중복 체크
    @GetMapping("/codeDuplicate")
    @ResponseBody
    public int codeDuplicate(@RequestParam String member_code){
        int result = memberService.codeDuplicate(member_code);
        if(result > 0){
            return 1;
        }else {
            return 0;
        }
    }

    //강사번호 조회
    @GetMapping("/codeCheck")
    @ResponseBody
    public int codeCheck(@RequestParam("member_code") String code){
        int result = memberService.codeCheck(code);
        if(result == 1){
            return 1;
        }else{
            return 0;
        }
    }

}