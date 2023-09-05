package com.project.jeans.controller.calendar;


import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.calendar.dto.CalendarDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.calendar.CalendarService;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class CalendarController {

    @Autowired
    private final CalendarService calendarService;
    private final MemberService memberService;

    @GetMapping(value = "/main1", params = "method=list")
    public String list(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        return "main/main";
    }

    @GetMapping(value = "selectPlan", params = "method=data", produces = "application/json")
    @ResponseBody // JSON 데이터를 반환
    public List<CalendarDTO> selectPlan() {

        List<CalendarDTO> calendarList = calendarService.calenList();
        return calendarList; // 실제 데이터를 반환
    }

    @ResponseBody
    @PostMapping(value = "insertPlan", produces = "application/json")
    public String insertPlan(@RequestBody CalendarDTO calendarDTO, @RequestParam("method") String method) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            // 시작 날짜 파싱
            Date startDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(calendarDTO.getStart());
            calendarDTO.setStart(dateFormat.format(startDate));

            // 종료 날짜 파싱
            Date endDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(calendarDTO.getEnd());
            calendarDTO.setEnd(dateFormat.format(endDate));

            System.out.println(startDate+"/"+endDate);
            // 날짜 파싱 성공, 이제 calendarDTO를 사용할 수 있음
            // ... (나머지 로직)
            calendarService.insertPlan(calendarDTO);
            return "Success"; // 또는 적절한 응답 메시지 반환
        } catch (ParseException e) {
            e.printStackTrace();
            return "Invalid date format"; // 날짜 형식이 잘못되었을 때 처리
        }
    }
}