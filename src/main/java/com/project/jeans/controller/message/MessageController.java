package com.project.jeans.controller.message;

import com.project.jeans.domain.message.dto.MessageDTO;
import com.project.jeans.service.message.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/message")
@RequiredArgsConstructor
@Controller
public class MessageController {

    private final MessageService messageService;

    /* 메시지 목록 조회(수신함) */
    @GetMapping("/messageReceiveList")
    public String selectReceiveMessage(Model model){
        //파라미터 : 로그인한 회원 넘기기 <mapper에서 바꿔주기>
        List<MessageDTO> messageDTOs = messageService.selectReceiveMessage();
        model.addAttribute("messageDTO",messageDTOs);
        return "/message/messageReceiveList";
    }

    /* 메시지 목록 조회(발신함)*/
    @GetMapping("/messageSendList")
    public String selectSendMessage(Model model){
        //파라미터 : 로그인한 회원 넘기기 <mapper에서 바꿔주기>
        List<MessageDTO> messageDTOs = messageService.selectSendMessage();
        model.addAttribute("messageDTO",messageDTOs);
        return "/message/messageSendList";
    }









}
