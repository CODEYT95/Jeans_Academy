package com.project.jeans.domain.board.board1.dto;

import lombok.*;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment1DTO {
    private int board1_no;
    private String comment1_content;
    private String comment1_isshow;
    private int comment1_no;
    private Timestamp comment1_regdate;
    private String member_id;
    private String member_class;
    private String member_name;
}
