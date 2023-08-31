package com.project.jeans.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {

    @RequestMapping("/main1")
    public String main(Model model){
        model.addAttribute("image", "image/cat.png");
        return "main/main";
    }

}
