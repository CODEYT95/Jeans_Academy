package com.project.jeans.service.calendar;

import com.project.jeans.domain.calendar.dto.CalendarDTO;

import java.util.List;

public interface CalendarService {
    public List<CalendarDTO> selectCalendar(String member_id);
    public int insertEvent(CalendarDTO calendarDTO);
}
