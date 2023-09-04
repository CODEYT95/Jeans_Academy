package com.project.jeans.controller.board.board1;

import com.project.jeans.service.board.board1.Comment1Service;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RequestMapping("/comment1")
@RequiredArgsConstructor
@RestController
public class Comment1Controller {

    private static Logger logger = LoggerFactory.getLogger(Comment1Controller.class);
    private final Comment1Service comment1Service;


    //댓글 입력(Controller)
    /*@PostMapping("/write")
    public ModelAndView writeComment1(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no){
        int writeRow = comment1Service.writeComment1(map);
        if(writeRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }*/

    //댓글 입력(RestController)
    @PostMapping("/write")
    public ModelAndView create(ModelAndView modelAndView, @RequestParam Map<String, Object> map, @RequestParam int board1_no) throws Exception{
        logger.info("POST /write : " + map.toString());
        int writeRow = comment1Service.writeComment1(map);
        if(writeRow==1){
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }else {
            modelAndView.setViewName("redirect:/board1/detail/"+board1_no);
        }
        return modelAndView;
    }

    //댓글 상세 조회(Controller)
/*
    @GetMapping("/update")
    public String readComment1(@RequestParam Map<String,Object> map, Model model){
        Map<String,Object> commentMap= comment1Service.getComment1Detail(map);
        model.addAllAttributes(commentMap);
        return "/board1/board1Modal";
    }
*/

    // 수정을 위한 댓글 상세 조회(RestController...?)
    @GetMapping("/update")
    public String readComment1(@RequestParam Map<String,Object> map, Model model){
        Map<String,Object> commentMap= comment1Service.getComment1Detail(map);
        model.addAllAttributes(commentMap);
        return "/board1/board1Modal";
    }


/*
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
*/

    //댓글 수정(RestController)
    @PutMapping("/update")
    public void updateComment1(@RequestParam Map<String, Object> updateMap) throws Exception{
        logger.info("PUT data : " + updateMap.toString());
        comment1Service.updateComment1(updateMap);
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
