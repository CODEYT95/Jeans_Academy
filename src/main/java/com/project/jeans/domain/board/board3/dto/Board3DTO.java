package com.project.jeans.domain.board.board3.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
public class Board3DTO {

    private int board3_no;
    private String board3_title;
    private String board3_content;
    private Timestamp board3_regdate;
    private String board3_isshow;
    private String member_id;

}