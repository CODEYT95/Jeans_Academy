package com.project.jeans.domain.calendar.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CalendarDTO {

    private int id;
    private String title;
    private LocalDateTime start;
    private LocalDateTime end;
    private boolean allDay;
    private String member_id;

}
