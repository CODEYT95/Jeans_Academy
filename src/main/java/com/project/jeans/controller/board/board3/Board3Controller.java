package com.project.jeans.controller.board.board3;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board3")
@Controller
public class Board3Controller {

    @GetMapping("/list")
    public String board1List(){
        return "/board3/board3List";
    }



}
