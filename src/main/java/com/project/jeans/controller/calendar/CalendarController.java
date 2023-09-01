package com.project.jeans.controller.calendar;

import com.project.jeans.domain.calendar.dto.CalendarDTO;
import com.project.jeans.service.calendar.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @Autowired
    private final CalendarService calendarService;


    public CalendarController(CalendarService calendarService) {
        this.calendarService = calendarService;
    }
    @GetMapping("/{member_id}")
    public List<CalendarDTO> getEventsByUserId(@PathVariable String member_id) {
        return calendarService.selectCalendar(member_id);
    }

    @PostMapping("/inertCalendar")
    public int insertEvent(
            CalendarDTO calendarDTO){

        return calendarService.insertEvent(calendarDTO);
    }
}