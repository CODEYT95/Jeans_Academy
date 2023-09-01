package com.project.jeans.controller.paln;

import com.project.jeans.domain.plan.dto.PlanDTO;
import com.project.jeans.service.plan.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/planInsert", method = RequestMethod.POST)
    @ResponseBody
    public String insertPlan(@RequestParam("date") String dateStr, @RequestParam("title") String title) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷 정의
            Date date = dateFormat.parse(dateStr); // 문자열로 받은 날짜를 Date로 변환

            PlanDTO planDTO = new PlanDTO();
            planDTO.setPlan_regdate(date);
            planDTO.setPlan_title(title);

            int result = planService.insrtPlan(planDTO);

            if (result > 0) {
                return "redirect:/plan/planlist";
            } else {
                return "failure";
            }
        } catch (ParseException e) {

            return "failure";
        }
    }
}