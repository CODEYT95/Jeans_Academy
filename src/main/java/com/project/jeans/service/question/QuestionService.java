package com.project.jeans.service.question;

import com.project.jeans.domain.question.dto.QuestionDTO;

import java.util.List;

public interface QuestionService {
    List<QuestionDTO> selectQuestionAll();
}
