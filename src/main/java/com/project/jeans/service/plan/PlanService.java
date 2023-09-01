package com.project.jeans.service.plan;

import com.project.jeans.domain.plan.dto.PlanDTO;

import java.util.List;

public interface PlanService {
   List<PlanDTO> selectPlanAll();

   public int insertPlan(PlanDTO planDTO);
}
