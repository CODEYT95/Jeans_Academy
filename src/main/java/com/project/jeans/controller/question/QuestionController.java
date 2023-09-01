package com.project.jeans.controller.question;

import com.project.jeans.domain.question.dto.QuestionDTO;
import com.project.jeans.service.question.QuestionService;
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
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/list")
    public String questionList(Model model) {
        List<QuestionDTO> questionList = questionService.selectQuestionAll();
        model.addAttribute("questionList", questionList);
        return "question/questionlist";
    }


    @RequestMapping("/write")
    public String insertQuestion(){
        return "/question/questionWrite";
    }

    @RequestMapping(value = "/write",method = RequestMethod.POST)
    public ModelAndView insertQuestion(@RequestParam("title") String title, @RequestParam("content") String content, ModelAndView modelAndView){
        QuestionDTO questionDTO = new QuestionDTO();
        questionDTO.setQuestion_title(title);
        questionDTO.setQuestion_content(content);
        int result = questionService.insertQuestion(questionDTO);
        if(result > 0){
            modelAndView.setViewName("redirect:http://localhost:8090/question/list");
        }else{
            modelAndView.setViewName("redirect:/question/questionWrite");
        }
        return modelAndView;
    }

}