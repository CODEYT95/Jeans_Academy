package com.project.jeans.domain.question.dto;

import lombok.Data;

import java.util.Date;

@Data
public class QuestionDTO {
    private int question_no;
    private String question_title;
    private String question_content;
    private Date question_regdate;
    private String question_isshow;
    private String member_id;
}
