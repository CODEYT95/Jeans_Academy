package com.project.jeans.domain.question.dao;

import com.project.jeans.domain.question.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface QuestionDAO {
    List<QuestionDTO> selectQuestionAll();
}

