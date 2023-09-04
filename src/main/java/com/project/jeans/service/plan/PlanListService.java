package com.project.jeans.service.plan;

import com.project.jeans.domain.plan.dto.PlanListDTO;

import java.util.List;

public interface PlanListService {
   List<PlanListDTO> selectPlanAll();
}
