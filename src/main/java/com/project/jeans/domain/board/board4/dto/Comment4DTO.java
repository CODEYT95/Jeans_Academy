package com.project.jeans.domain.board.board4.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment4DTO {
    private int board4_no;
    private String comment4_content;
    private String comment4_isshow;
    private int comment4_no;
    private Timestamp comment4_regdate;
    private String member_id;
}
