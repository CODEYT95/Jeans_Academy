package com.project.jeans.controller.paln;

import com.project.jeans.domain.plan.dto.PlanListDTO;
import com.project.jeans.service.plan.PlanListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PlanListController {
    @Autowired
    private PlanListService planService;

    @RequestMapping("/plan")
    public String planlist(Model model) {
        List<PlanListDTO> PlanList = planService.selectPlanAll();
        model.addAttribute("planList", PlanList);
        return "plan/planlist";
    }

    @RequestMapping(value = "/planInsert", method = RequestMethod.POST)
    @ResponseBody
    public String addPlan(@RequestParam("date") String date, @RequestParam("title") String title) {
        System.out.println(date);
        System.out.println(title);

        // 여기에서 받은 데이터를 이용하여 DB에 추가 작업을 수행하고 성공 메시지 반환

        return "success";
    }

}
