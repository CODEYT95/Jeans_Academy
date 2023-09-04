package com.project.jeans.controller.question;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.question.QuestionService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/question")
@RequiredArgsConstructor
public class QuestionController {

    @Autowired
    private QuestionService questionService;
    private final MemberService memberService;

    @RequestMapping("/list")
    public String questionList(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        List<QuestionDTO> questionList = questionService.selectQuestionAll();
        model.addAttribute("questionList", questionList);
        return "question/questionlist";
    }


    @RequestMapping("/write")
    public String insertQuestion(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        return "/question/questionWrite";
    }

    @RequestMapping(value = "/write",method = RequestMethod.POST)
    public ModelAndView insertQuestion(@RequestParam("title") String title, @RequestParam("content") String content, ModelAndView modelAndView, HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:member/login");
        }

        QuestionDTO questionDTO = new QuestionDTO();
        questionDTO.setQuestion_title(title);
        questionDTO.setQuestion_content(content);
        int result = questionService.insertQuestion(questionDTO);
        if(result > 0){
            modelAndView.setViewName("redirect:/question/list");
        }else{
            modelAndView.setViewName("redirect:/question/write");
        }
        return modelAndView;
    }

}