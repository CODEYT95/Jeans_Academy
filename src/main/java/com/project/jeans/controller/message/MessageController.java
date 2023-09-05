package com.project.jeans.controller.message;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.message.dto.MessageDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.message.MessageService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RequestMapping("/message")
@RequiredArgsConstructor
@Controller
public class MessageController {

    private final MemberService memberService;
    private final MessageService messageService;

    /* 메시지 목록 조회(수신함) 및 목록 조회(발신함)*/
    @GetMapping("/messageList")
    public String selectReceiveMessage(HttpSession session, Model model){

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        // 로그인이 필요한 경우 리디렉션
        if (memberInfo == null) {return "/member/login";}

        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<MessageDTO> messageRecDTO = messageService.selectReceiveMessage(memberInfo.getMember_id());
        model.addAttribute("messageRecDTO",messageRecDTO);
        List<MessageDTO> messageSendDTO = messageService.selectSendMessage(memberInfo.getMember_id());
        model.addAttribute("messageSendDTO",messageSendDTO);
        List<MemberDTO> messageMemberDTO = messageService.selectMessageMemList();
        model.addAttribute("messageMemberDTO",messageMemberDTO);

        return "/message/messageList";

    }

    /* 메시지 작성(보내기) */
    @PostMapping("/send")
    public ModelAndView sendMessage(@RequestParam Map<String,Object> map, HttpSession session, ModelAndView modelAndView, Model model){

        System.out.println(map);

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/member/login");
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        int sendMessage = messageService.insertContentMessage(map);

        if(sendMessage == 1){
            modelAndView.setViewName("redirect:/message/messageList");
        } else {
            modelAndView.setViewName("redirect:/message/messageList");
        }

        return modelAndView;

    }








}
