package com.project.jeans.domain.mypage.dto;

import lombok.Data;

import java.util.Date;

@Data
public class MyPageDTO {
    private int mypage_no;
    private String mypage_content;
    private Date mypage_regdate;

}
