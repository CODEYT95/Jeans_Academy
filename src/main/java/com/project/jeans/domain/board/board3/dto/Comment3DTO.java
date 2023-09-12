package com.project.jeans.domain.board.board3.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment3DTO {
    private int board3_no;
    private String comment3_content;
    private String comment3_isshow;
    private int comment3_no;
    private Timestamp comment3_regdate;
    private String member_id;
    private String member_name;
}
