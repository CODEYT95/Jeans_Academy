package com.project.jeans.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mainTestController {

    @RequestMapping("/test")
    public String test(Model model){

        return "main/mainTest";
    }

}
