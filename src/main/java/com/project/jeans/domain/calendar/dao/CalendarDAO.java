package com.project.jeans.domain.calendar.dao;

import com.project.jeans.domain.calendar.dto.CalendarDTO;

import java.util.List;

public class CalendarDAO {

    List<CalendarDTO> selectAll() {
        return null;
    }

    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
