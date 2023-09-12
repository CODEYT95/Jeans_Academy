package com.project.jeans.controller.mypage;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.mypage.MyPageService;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private MyPageService myPageService;

    @RequestMapping("/list")
    public String eventList(Model model, HttpSession session) {
        String member_id = (String) session.getAttribute("member_id");
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        String category = "mypage";
        model.addAttribute("category", category);
        model.addAttribute("member_name", memberInfo.getMember_name());
        model.addAttribute("member_class", memberInfo.getMember_class());
        model.addAttribute("member_type", memberInfo.getMember_type());

        System.out.println("2" + member_id);
        //개인정보 조회
        MemberDTO member = myPageService.selectMember(member_id);
        model.addAttribute("member", member);
        System.out.println("3" + member_id);
        //게시글 제목 조회
        List<MyPageDTO> board = myPageService.selectboard(member_id);
        model.addAttribute("board", board);
        /*
        List<MyPageDTO> question = myPageService.selectQA(member_id);
        model.addAttribute("question", question);
        */

        List<MyPageDTO> eventList = myPageService.selectEvent(member_id);
        model.addAttribute("eventList", eventList);

        return "/mypage/mypagelist";
    }

    @PostMapping(value = "/write")
    @ResponseBody
    public String addEvent(@RequestParam("date") Date date, @RequestParam("title") String title, HttpSession session) {
        MyPageDTO myPageDTO = new MyPageDTO();
        String member_id = (String) session.getAttribute("member_id");
        myPageDTO.setMember_id(member_id);
        myPageDTO.setMypage_content(title);
        myPageDTO.setMypage_regdate(date);
        int result = myPageService.addEvent(myPageDTO);
        System.out.println(result);
        if (result > 0) {
            System.out.println("일정 입력 성공");
            return "1";
        } else {
            System.out.println("일정 입력 실패");
            return "0";
        }
    }

    @PostMapping(value = "/delete")
    @ResponseBody
    public String eventDelete(@RequestParam("mypage_no") int mypage_no, HttpSession session, Model model) {
        System.out.println("컨트롤러 진입");
        String member_id = (String) session.getAttribute("member_id");
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        System.out.println(mypage_no);
        int result = myPageService.eventDelete(mypage_no);
        if (result > 0) {
            System.out.println("일정 삭제 성공");
            return "1";
        } else {
            System.out.println("일정 삭제 실패");
            return "0";
        }
    }

    @PostMapping(value = "/addEvent", produces = "application/json")
    @ResponseBody
    public Map<String, Object> addAttend(@RequestBody Map<String, Object> requestBody, HttpSession session, Model model) throws ParseException {
        System.out.println("컨트롤러 진입");
        String member_id = (String) session.getAttribute("member_id");
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        String formattedDate = (String) requestBody.get("formattedDate");

        // ISO 8601 형식의 문자열을 Date 객체로 변환
        SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        Date date = isoFormat.parse(formattedDate);

        System.out.println(date);
        MyPageDTO myPageDTO = new MyPageDTO();
        myPageDTO.setMember_id((String) session.getAttribute("member_id"));
        myPageDTO.setAttend_regdate(date);
        int result = myPageService.addAttend(myPageDTO);
        System.out.println(result);
        if (result == 1) {
            // 받은 데이터 활용하여 필요한 로직 수행

            Map<String, Object> response = new HashMap<>();
            response.put("result", "success"); // 유효한 JSON 형태로 응답 데이터 생성

            return response; // 응답 데이터 반환
        }

        return requestBody;
    }
}