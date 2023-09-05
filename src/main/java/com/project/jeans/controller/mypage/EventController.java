package com.project.jeans.controller.mypage;

import com.project.jeans.domain.mypage.dto.EventDTO;
import com.project.jeans.service.mypage.EventService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @RequestMapping("/list")
    public String eventList(Model model) {
        EventDTO eventDTO = new EventDTO();
        List<EventDTO> eventList = eventService.selectMyPageAll();
        model.addAttribute("eventList", eventList);
        return "/mypage/mypagelist";
    }

    @PostMapping("/write")
    public String addEvent(@RequestParam("date") Date date, @RequestParam("title") String title, HttpSession session, ModelAndView modelAndView) {
        System.out.println("write컨트롤러 들어옴");
        EventDTO eventDTO = new EventDTO();
        eventDTO.setMypage_content(title);
        eventDTO.setMypage_regdate(date);
        String member_id = (String) session.getAttribute("member_id");
        eventDTO.setMember_id(member_id);
        int result = eventService.addEvent(eventDTO);
        System.out.println(result);
        if(result > 0){
            return "1";
        }
        return "/mypage/mypagelist";
    }

}