package com.project.jeans.service.calendar;

import com.project.jeans.domain.calendar.dao.CalendarDAO;
import com.project.jeans.domain.calendar.dto.CalendarDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {
    @Autowired(required = false)
    private final CalendarDAO calendarDAO;

    @Override
    public int insertCalendar(CalendarDTO calendarDTO) {
        return 0;
    }

    @Override
    public ArrayList<CalendarDTO> calenList() {
        return calendarDAO.calenList();
    }

    @Override
    public void selectCalendar(Object memberId) {

    }
}
