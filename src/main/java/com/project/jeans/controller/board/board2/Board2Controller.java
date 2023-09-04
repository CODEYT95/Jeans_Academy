package com.project.jeans.controller.board.board2;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/board2")
@Controller
public class Board2Controller {

    @GetMapping("/list")
    public String board1List(){
        return "/board/board2/board2List";
    }



}
