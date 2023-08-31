package com.project.jeans.controller.calendar;

import com.project.jeans.domain.calendar.dto.CalendarDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
    private List<CalendarDTO> events = new ArrayList<>();

    @GetMapping
    public String showCalendarPage() {
        return "calendar"; // 웹 페이지 이름 (calendar.html) 리턴
    }

    @GetMapping("/events")
    @ResponseBody
    public List<CalendarDTO> getAllEvents() {
        return events;
    }

    @PostMapping("/events")
    @ResponseBody
    public CalendarDTO createEvent(@RequestBody CalendarDTO event) {

        CalendarDTO Calendar = null;
        events.add(Calendar);
        return Calendar;
    }
}