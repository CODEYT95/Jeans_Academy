package com.project.jeans.domain.admin.notice.dto;

import lombok.Data;
import lombok.Getter;

import java.sql.Timestamp;

@Data
public class NoticeDTO {

    private int notice_no;
    private String notice_title;
    private String notice_content;
    private Timestamp notice_regdate;
    private String member_id;
    private String notice_isshow;
    private int notice_count;

}
