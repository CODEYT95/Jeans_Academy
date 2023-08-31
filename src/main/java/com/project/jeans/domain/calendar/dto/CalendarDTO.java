package com.project.jeans.domain.calendar.dto;

import lombok.Data;

import java.util.Date;

@Data
public class CalendarDTO {

    private int id;
    private int groupId;
    private String title;
    private String writer;
    private String content;
    private Date start1;
    private Date end1;
    private int allDay;
    private String textColor;
    private String backgroundColor;
    private String borderColor;

}
