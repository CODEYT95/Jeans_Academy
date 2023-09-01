package com.project.jeans.domain.plan.dto;

import lombok.Data;

import java.util.Date;

@Data
public class PlanListDTO {
    private int plan_no;
    private String plan_title;
    private String plan_content;
    private Date plan_regdate;

}
