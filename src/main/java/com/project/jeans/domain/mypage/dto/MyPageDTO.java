package com.project.jeans.domain.mypage.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPageDTO {
    private String attend;
    private Date attend_regdate;
    private int mypage_no;
    private String member_id;
    private Date mypage_regdate;
    private String mypage_content;
    private int board1_no;
    private int board2_no;
    private int board3_no;
    private int board4_no;
    private String board1_title;
    private String board2_title;
    private String board3_title;
    private String board4_title;
}


