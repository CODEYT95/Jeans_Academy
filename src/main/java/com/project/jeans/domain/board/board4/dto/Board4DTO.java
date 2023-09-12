package com.project.jeans.domain.board.board4.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
public class Board4DTO {

    private int board4_no;
    private String board4_title;
    private String board4_content;
    private Timestamp board4_regdate;
    private String board4_isshow;
    private String member_id;
    private String member_name;

}