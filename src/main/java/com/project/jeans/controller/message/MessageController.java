package com.project.jeans.controller.message;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.message.dto.MessageDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.message.MessageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/message")
@RequiredArgsConstructor
@Controller
public class MessageController {

    private final MessageService messageService;
    private final MemberService memberService;

    /* 메시지 목록 조회(수신함) 및 목록 조회(발신함) - 1page*/
    @GetMapping("/messageList")
    public String selectReceiveMessage(Model model, HttpSession session){

        String member_id = (String)session.getAttribute("member_id");

        if (member_id == null) {
            return "/member/login";
        }
        MemberDTO memberInfo = memberService.getMemberInfo(member_id);
        if(memberInfo != null){
            String member_name = memberInfo.getMember_name();
            String member_class = memberInfo.getMember_class();
            model.addAttribute("member_name", member_name);
            model.addAttribute("member_class", member_class);
        }

        List<MessageDTO> messageRecDTO = messageService.selectReceiveMessage(member_id);
        List<MessageDTO> messageSendDTO = messageService.selectSendMessage(member_id);
        model.addAttribute("messageRecDTO",messageRecDTO);
        model.addAttribute("messageSendDTO",messageSendDTO);

        return "/message/messageList";
    }

    //메시지 상세 보기(수신함)


    //메시지 상세 보기(발신함)



    //메시지 보내기(form)



    //메시지 보내기(send)






}
