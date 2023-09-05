package com.project.jeans.controller.board.board1;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.service.board.board1.Comment1Service;
import com.project.jeans.service.member.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RequestMapping("/comment1")
@RequiredArgsConstructor
@Controller
public class Comment1Controller {

    private final MemberService memberService;
    private final Comment1Service comment1Service;

    //댓글 입력
    @PostMapping("/write")
    public ModelAndView create(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no) throws Exception{
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        int writeRow = comment1Service.writeComment1(map);
        if(writeRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }

   //댓글 수정(Controller)
    @PostMapping("/update")
    public ModelAndView updateComment1(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        int updateRow = comment1Service.updateComment1(map);
        if(updateRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }

    //댓글 삭제
    @PostMapping("/delete")
    public ModelAndView deleteComment1(HttpSession session, Model model, ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return new ModelAndView("redirect:/login");
        }

        int deleteRow = comment1Service.deleteComment1(map);
        if(deleteRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }
}
