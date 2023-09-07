package com.project.jeans.controller.mypage;

import com.project.jeans.domain.mypage.dto.EventDTO;
import com.project.jeans.service.mypage.EventService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        return "mypage/mypagelist"; // 슬래시 제거
    }

    @PostMapping("/write")
    public String addEvent(@RequestParam("date") Date date, @RequestParam("title") String title, HttpSession session, ModelAndView modelAndView) {
        System.out.println("write 컨트롤러 들어옴");
        EventDTO eventDTO = new EventDTO();
        eventDTO.setMypage_content(title);
        eventDTO.setMypage_regdate(date);
        String member_id = (String) session.getAttribute("member_id");
        eventDTO.setMember_id(member_id);
        int result = eventService.addEvent(eventDTO);
        System.out.println(result);
        if(result > 0){
            return "redirect:/event/list"; // 이벤트 추가 후 이벤트 목록 페이지로 리다이렉트
        }
        return "mypage/mypagelist";
    }

    @GetMapping("/check")
    public String showCalendarPage() {
        // calendar.jsp로 이동
        return "calendar";
    }


    @ResponseBody
    @PostMapping(value = "addEvent", produces = "application/json")
    public ResponseEntity<String> insertPlan(@RequestBody EventDTO eventDTO, @RequestParam("method") String method) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        SimpleDateFormat targetDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            // 날짜 파싱
            String mypageRegdateStr = String.valueOf(eventDTO.getMypage_regdate()); // mypage_regdate를 문자열로 가져옴
            Date mypage_regdate = dateFormat.parse(mypageRegdateStr);

            // 날짜 파싱 성공, 이제 eventDTO를 사용할 수 있음
            eventService.addEvent(eventDTO);
            return ResponseEntity.ok("Success"); // 또는 적절한 응답 메시지 반환
        } catch (ParseException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("Invalid date format"); // 날짜 형식이 잘못되었을 때 처리
        }
    }


        }



