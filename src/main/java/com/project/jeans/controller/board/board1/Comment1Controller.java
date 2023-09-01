package com.project.jeans.controller.board.board1;

import com.project.jeans.service.board.board1.Comment1Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RequestMapping("/comment1")
@RequiredArgsConstructor
@Controller
public class Comment1Controller {

    private final Comment1Service comment1Service;

    //댓글 입력
    @PostMapping("/write")
    public ModelAndView create(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no) throws Exception{
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
    public ModelAndView updateComment1(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
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
    public ModelAndView deleteComment1(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        int deleteRow = comment1Service.deleteComment1(map);
        if(deleteRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }
}
