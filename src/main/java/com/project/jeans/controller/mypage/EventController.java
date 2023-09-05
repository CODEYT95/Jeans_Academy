package com.project.jeans.controller.mypage;

import com.project.jeans.domain.mypage.dto.EventDTO;
import com.project.jeans.service.mypage.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/write",method = RequestMethod.POST)
    public ModelAndView addEvent(@RequestParam("content") String content, @RequestParam("Date") Date regdate, ModelAndView modelAndView){
        EventDTO eventDTO = new EventDTO();
        eventDTO.setMypage_content(content);
        eventDTO.setMypage_regdate(regdate);
        int result = eventService.addEvent(eventDTO);
        if(result > 0){
            modelAndView.setViewName("redirect:/event/list");
        }
        return modelAndView;
    }

}