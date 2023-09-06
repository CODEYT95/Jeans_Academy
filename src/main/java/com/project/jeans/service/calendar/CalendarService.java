package com.project.jeans.service.calendar;

import com.project.jeans.domain.calendar.dto.CalendarDTO;

import java.util.ArrayList;

public interface CalendarService {


    public int insertPlan(CalendarDTO calendarDTO);

    public ArrayList<CalendarDTO> calenList();

}