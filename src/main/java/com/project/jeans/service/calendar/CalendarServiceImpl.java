package com.project.jeans.service.calendar;

import com.project.jeans.domain.calendar.dao.CalendarDAO;
import com.project.jeans.domain.calendar.dto.CalendarDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {
    @Autowired
    private final CalendarDAO calendarDAO;


    @Override
    public List<CalendarDTO> selectCalendar(String member_id) {
        return calendarDAO.selectCalendar(member_id);
    }

    @Override
    public int insertEvent(CalendarDTO calendarDTO) {
        return calendarDAO.insertEvent(calendarDTO);
    }
}
