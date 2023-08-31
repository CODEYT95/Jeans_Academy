package com.project.jeans.controller.question;

import com.project.jeans.domain.question.dto.QuestionDTO;
import com.project.jeans.service.question.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/question")
    public String questionList(Model model) {
        List<QuestionDTO> questionList = questionService.selectQuestionAll();
        model.addAttribute("questionList", questionList);
        return "question/list";
    }
}