package com.project.jeans.service.question;

import com.project.jeans.domain.question.dao.QuestionDAO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService{
    private final QuestionDAO questionDAO;

    @Override
    public List<QuestionDTO> selectQuestionAll() {
        return questionDAO.selectQuestionAll();
    }

    @Override
    public int insertQuestion(QuestionDTO questionDTO) {
        return questionDAO.insertQuestion(questionDTO);
    }
}
