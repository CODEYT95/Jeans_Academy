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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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


        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());
        //파라미터 : 로그인한 회원 넘기기 <mapper에서 바꿔주기>
        List<MessageDTO> messageRecDTO = messageService.selectReceiveMessage(memberInfo.getMember_id());
        model.addAttribute("messageRecDTO",messageRecDTO);
        List<MessageDTO> messageSendDTO = messageService.selectSendMessage(memberInfo.getMember_id());
        model.addAttribute("messageSendDTO",messageSendDTO);
        return "/message/messageList";
    }
}
