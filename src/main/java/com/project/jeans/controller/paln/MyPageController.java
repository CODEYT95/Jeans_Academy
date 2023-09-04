package com.project.jeans.controller.paln;

import com.project.jeans.domain.mypage.dto.MyPageDTO;
import com.project.jeans.service.mypage.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MyPageController {
    @Autowired
    private MypageService mypageService;

    @RequestMapping("/mypage")
    public String mypagelist(Model model) {
        List<MyPageDTO> myPageAll = mypageService.selectMyPageAll();
        model.addAttribute("mypagelist", myPageAll );
        return "mypage/mypagelist";
    }

    @RequestMapping(value = "/mypageInsert", method = RequestMethod.POST)
    @ResponseBody
    public String addmypage(@RequestParam("date") String date, @RequestParam("content") String content) {
        System.out.println(date);
        System.out.println(content);

        // 여기에서 받은 데이터를 이용하여 DB에 추가 작업을 수행하고 성공 메시지 반환

        return "success";
    }

}
