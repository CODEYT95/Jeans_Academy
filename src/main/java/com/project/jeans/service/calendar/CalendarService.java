package com.project.jeans.service.calendar;

import com.project.jeans.domain.calendar.dto.CalendarDTO;

import java.util.ArrayList;
import java.util.List;

public interface CalendarService {

    public int insertCalendar(CalendarDTO calendarDTO);

    public ArrayList<CalendarDTO> calenList();

    void selectCalendar(Object memberId);
}