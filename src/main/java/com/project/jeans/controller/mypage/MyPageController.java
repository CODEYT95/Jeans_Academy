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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "member/login";
        }
        //개인정보 조회
        MemberDTO member = myPageService.selectMember(member_id);
        model.addAttribute("member",member);
        //게시글 제목 조회
        List<MyPageDTO> board = myPageService.selectboard(member_id);
        model.addAttribute("board", board);

        MyPageDTO myPageDTO = new MyPageDTO();
        List<MyPageDTO> eventList = myPageService.selectMyPageAll(member_id);
        model.addAttribute("eventList", eventList);
        return "/mypage/mypagelist";
    }

    @PostMapping("/write")
    public String addEvent(@RequestParam("date") Date date, @RequestParam("title") String title, HttpSession session, ModelAndView modelAndView) {
        System.out.println("write컨트롤러 들어옴");
        MyPageDTO myPageDTO = new MyPageDTO();
        myPageDTO.setMypage_content(title);
        myPageDTO.setMypage_regdate(date);
        String member_id = (String) session.getAttribute("member_id");
        myPageDTO.setMember_id(member_id);
        int result = myPageService.addEvent(myPageDTO);
        System.out.println(result);
        if(result > 0){
            return "1";
        }
        return "/mypage/mypagelist";
    }
}