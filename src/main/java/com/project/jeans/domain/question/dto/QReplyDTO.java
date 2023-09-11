package com.project.jeans.domain.question.dto;

import lombok.Data;

@Data
public class QReplyDTO {

    private int comment_no;
    private int question_no;
    private String comment_content;
    private String comment_regdate;
    private String comment_isshow;
    private String member_id;
    private String member_class;
    private String member_name;
    private String qeustion_count;
}
