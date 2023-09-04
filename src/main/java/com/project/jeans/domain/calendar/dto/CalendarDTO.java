package com.project.jeans.domain.calendar.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CalendarDTO {

    private int id;
    private String groupId;
    private String title;
    private String writer;
    private String content;
    private String start;
    private String end;
    private boolean allday;
    private String textColor;
    private String backgroundColor;
    private String borderColor;
}
