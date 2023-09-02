package com.project.jeans.domain.plan.dto;

import lombok.Data;

import java.util.Date;

@Data
public class PlanDTO {
    private int todo_no;
    private String todo_content;
    private Date todo_regdate;
}
