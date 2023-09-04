package com.project.jeans.controller.board.board1;

import com.project.jeans.service.board.board1.Comment1ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RequestMapping("/comment1")
@RequiredArgsConstructor
@Controller
public class Comment1Controller {

    private final Comment1ServiceImpl comment1ServiceImpl;

    //댓글 입력
    @PostMapping("/write")
    public ModelAndView writeComment1(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        int writeRow = comment1ServiceImpl.writeComment1(map);
        if(writeRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }

/*    //댓글 상세 조회
    @GetMapping("/update")
    public ModelAndView readComment1(@RequestParam Map<String,Object> map, ModelAndView modelAndView, @RequestParam int board1_no){
        Comment1DTO comment1DTO= comment1ServiceImpl.getComment1Detail(map);
        modelAndView.setViewName("redirect:/board1/detail/"+ board1_no);
        return modelAndView;
    }*/

/*
   //댓글 수정
    @PostMapping("/update")
    public ModelAndView updateComment1(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        int updateRow = comment1ServiceImpl.updateComment1(map);
        if(updateRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }
*/

    //댓글 삭제
    @PostMapping("/delete")
    public ModelAndView deleteComment1(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        int deleteRow = comment1ServiceImpl.deleteComment1(map);
        if(deleteRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }


}
