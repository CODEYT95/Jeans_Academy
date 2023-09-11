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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RequestMapping("/message")
@RequiredArgsConstructor
@Controller
public class MessageController {

    private final MemberService memberService;
    private final MessageService messageService;

    /* 메시지 처음 화면 */
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

        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);
        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/member/login");
        }
        model.addAttribute("member_id",memberInfo.getMember_id());
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        int sendMessage = messageService.insertContentMessage(map);

        if(sendMessage == 1){
            modelAndView.setViewName("redirect:/message/messageList");
        } else {
            modelAndView.setViewName("redirect:/message/messageSend");
        }

        return modelAndView;
    }


    /* 받은 쪽지함(폼) */
    @GetMapping("/recMsgList")
    public String getRecMsgList(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        // 로그인이 필요한 경우 리디렉션
        if (memberInfo == null) {return "/member/login";}
        model.addAttribute("member_id",memberInfo.getMember_id());
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<MessageDTO> messageRecDTO = messageService.selectReceiveMessage(memberInfo.getMember_id());
        model.addAttribute("messageRecDTO",messageRecDTO);
        List<MemberDTO> messageMemberDTO = messageService.selectMessageMemList();
        model.addAttribute("messageMemberDTO",messageMemberDTO);

        return "/message/messageRecList";
    }

    /* 보낸 쪽지함(폼) */
    @GetMapping("/sendMsgList")
    public String getSendMsgList(HttpSession session, Model model){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        // 로그인이 필요한 경우 리디렉션
        if (memberInfo == null) {return "/member/login";}
        model.addAttribute("member_id",memberInfo.getMember_id());
        model.addAttribute("member_name",memberInfo.getMember_name());
        model.addAttribute("member_class",memberInfo.getMember_class());
        model.addAttribute("member_type",memberInfo.getMember_type());

        List<MessageDTO> messageSendDTO = messageService.selectSendMessage(memberInfo.getMember_id());
        model.addAttribute("messageSendDTO",messageSendDTO);
        List<MemberDTO> messageMemberDTO = messageService.selectMessageMemList();
        model.addAttribute("messageMemberDTO",messageMemberDTO);

        return "/message/messageSendList";
    }

    /* 메시지 상세 조회 */
    @GetMapping("/read")
    public String readMessage(@RequestParam int message_no, Model model) {
        MessageDTO messageDTO = messageService.selectMessageDetail(message_no);
        model.addAttribute("messageDTO",messageDTO);
        return "/message/messageList";
    }

    /* 메시지 삭제 (수신함) */
    @GetMapping("/deleteRecMsg")
    public ModelAndView deleteReceiveMessage(@RequestParam List<Integer> message_no, ModelAndView modelAndView){

        if(message_no.isEmpty() || message_no.get(0) == null){
            return new ModelAndView("redirect:/message/messageList");
        }

        int deleteRecMsg = messageService.deleteReceiveMessage(message_no);

        if(deleteRecMsg==1){
            modelAndView.setViewName("redirect:/message/messageList");
        } else {
            modelAndView.setViewName("redirect:/message/messageList");
        }

        return modelAndView;
    }

    /* 메시지 삭제 (발신함) */
    @GetMapping("/deleteSendMsg")
    public ModelAndView deleteSendMessage(@RequestParam List<Integer> message_no, ModelAndView modelAndView){

        if(message_no.isEmpty() || message_no.get(0) == null){
            return new ModelAndView("redirect:/message/messageList");
        }

        int deleteSendMsg = messageService.deleteSendMessage(message_no);

        if(deleteSendMsg==1){
            modelAndView.setViewName("redirect:/message/messageList");
        } else {
            modelAndView.setViewName("redirect:/message/messageList");
        }

        return modelAndView;
    }

    /* 클래스별 멤버 조회 */
    @ResponseBody
    @GetMapping("/selectMemByClass")
    public Object selectMemByClass(@RequestParam("member_class") String member_class){
        List<MemberDTO> memberByClass = messageService.selectMemByClass(member_class);
        return memberByClass;
    }



}
