package com.project.jeans.controller.calendar;


import com.project.jeans.service.calendar.CalendarService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequiredArgsConstructor
public class CalendarController {

    @Autowired
    private final CalendarService calendarService;

    @GetMapping(value = "/main1", params="method=list")
    public String list() {
        return "main/main";
    }
    @GetMapping(params = "method=data")
    public String data(Model d) {
        d.addAttribute("list", calendarService.calenList());
        return "pageJsonReport";
    }
}