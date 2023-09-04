package com.project.jeans.controller.paln;

import com.project.jeans.domain.plan.dao.PlanDAO;
import com.project.jeans.domain.plan.dto.PlanDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import com.project.jeans.service.plan.PlanService;
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
public class PlanController {
    @Autowired
    private PlanService planService;

    @RequestMapping("/planlist")
    public String planlist(Model model) {
        List<PlanDTO> PlanList = planService.selectPlanAll();
        model.addAttribute("planList", PlanList);
        return "plan/planlist";
    }

}

