package com.project.jeans.controller.mypage;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.mypage.MyPageService;
import jakarta.servlet.http.HttpSession;
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

        System.out.println(member_id);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "member/login";
        }
        System.out.println("2"+member_id);
        //개인정보 조회
        MemberDTO member = myPageService.selectMember(member_id);
        model.addAttribute("member",member);
        //게시글 제목 조회
        System.out.println("3"+member_id);
        List<MyPageDTO> board = myPageService.selectboard(member_id);
        model.addAttribute("board", board);


        List<MyPageDTO> eventList = myPageService.selectEvent(member_id);
        model.addAttribute("eventList",eventList);

        return "/mypage/mypagelist";
    }
    @RequestMapping(value = "/write",method = RequestMethod.POST)
    public String addEvent(@RequestParam("date") Date date, @RequestParam("title") String title, HttpSession session, ModelAndView modelAndView) {
        MyPageDTO myPageDTO = new MyPageDTO();
        String member_id = (String) session.getAttribute("member_id");
        myPageDTO.setMember_id(member_id);
        myPageDTO.setMypage_content(title);
        myPageDTO.setMypage_regdate(date);
        int result = myPageService.addEvent(myPageDTO);
        System.out.println(result);
        if(result > 0){
            System.out.println("일정 입력 성공");
            return "1";
        }else {
            System.out.println("일정 입력 실패");
            return "0";
        }
    }
}