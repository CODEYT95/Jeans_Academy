package com.project.jeans.domain.member.dto;

import lombok.*;

import java.util.Date;

@Data
public class MemberDTO {
    private String member_id;
    private String member_pw;;
    private  String member_name;
    private Date member_day;
    private  String member_class;
    private String member_phone;
    private String member_accept;
    private String member_isshow;
    private String member_type;
    private String member_code;
}
