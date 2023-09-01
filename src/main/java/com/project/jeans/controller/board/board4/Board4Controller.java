package com.project.jeans.controller.board.board4;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board4")
@Controller
public class Board4Controller {

    @GetMapping("/list")
    public String board1List(){
        System.out.println("수정중(git에서 수정)");
        return "/board4/board4List";
    }



}
