package com.project.jeans.domain.admin.notice.dto;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeDTO {

    private int notice_no;
    private String notice_title;
    private String notice_content;
    private Date notice_regdate;
    private String member_name;
    private String member_class;
    private String notice_isshow;
}
