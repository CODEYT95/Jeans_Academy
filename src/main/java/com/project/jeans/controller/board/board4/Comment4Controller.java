package com.project.jeans.controller.board.board4;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.board.board4.Comment4Service;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RequestMapping("/comment4")
@RequiredArgsConstructor
@Controller
public class Comment4Controller {

    private final MemberService memberService;
    private final Comment4Service comment4Service;

    //댓글 입력
    @PostMapping("/write")
    public ModelAndView create(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board4_no) throws Exception{
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        int writeRow = comment4Service.writeComment4(map);
        if(writeRow==1){
            modelAndView.setViewName("redirect:/board4/detail/"+board4_no);
        }else {
            modelAndView.setViewName("redirect:/board4/detail/"+board4_no);
        }
        return modelAndView;
    }

    //댓글 수정(Controller)
    @PostMapping("/update")
    public ModelAndView updateComment4(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board4_no){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        int updateRow = comment4Service.updateComment4(map);
        if(updateRow==1){
            modelAndView.setViewName("redirect:/board4/detail/"+board4_no);
        }else {
            modelAndView.setViewName("redirect:/board4/detail/"+board4_no);
        }
        return modelAndView;
    }

    //댓글 삭제
    @PostMapping("/delete")
    public ModelAndView deleteComment4(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board4_no){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        int deleteRow = comment4Service.deleteComment4(map);
        if(deleteRow==1){
            modelAndView.setViewName("redirect:/board4/detail/"+board4_no);
        }else {
            modelAndView.setViewName("redirect:/board4/detail/"+board4_no);
        }
        return modelAndView;
    }

}