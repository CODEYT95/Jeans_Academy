package com.project.jeans.domain.admin.notice.dto;

import lombok.Data;
import lombok.Getter;

import java.sql.Timestamp;

@Data
public class NoticeDTO {

    private int notice_no;
    @Getter
    private String notice_title;
    private String notice_content;
    private Timestamp notice_regdate;
    private String member_name;
    private String member_class;
    private String notice_isshow;

}
