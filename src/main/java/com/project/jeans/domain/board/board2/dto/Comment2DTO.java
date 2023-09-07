package com.project.jeans.domain.board.board2.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment2DTO {
    private int board2_no;
    private String comment2_content;
    private String comment2_isshow;
    private int comment2_no;
    private Timestamp comment2_regdate;
    private String member_id;
}
