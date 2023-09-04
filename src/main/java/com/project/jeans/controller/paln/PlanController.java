package com.project.jeans.controller.paln;

import com.project.jeans.LoginCheckSession;
import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.plan.dao.PlanDAO;
import com.project.jeans.domain.plan.dto.PlanDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import com.project.jeans.service.member.MemberService;
import com.project.jeans.service.plan.PlanService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/plan")
@RequiredArgsConstructor
public class PlanController {
    @Autowired
    private PlanService planService;
    private final MemberService memberService;

    @RequestMapping("/planlist")
    public String planlist(HttpSession session, Model model) {
        LoginCheckSession loginCheck = new LoginCheckSession(memberService);
        MemberDTO memberInfo = loginCheck.getLoginCheckSession(session, model);

        if (memberInfo == null) {
            // 로그인이 필요한 경우 리디렉션
            return "/member/login";
        }

        List<PlanDTO> PlanList = planService.selectPlanAll();
        model.addAttribute("planList", PlanList);
        return "plan/planlist";
    }

}

