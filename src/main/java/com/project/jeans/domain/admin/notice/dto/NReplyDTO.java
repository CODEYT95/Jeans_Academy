package com.project.jeans.domain.admin.notice.dto;

import lombok.Data;

@Data
public class NReplyDTO {

    private int comment_no;
    private int notice_no;
    private String comment_content;
    private String comment_regdate;
    private String comment_isshow;
    private String member_id;
    private String member_class;
    private String member_name;
}
