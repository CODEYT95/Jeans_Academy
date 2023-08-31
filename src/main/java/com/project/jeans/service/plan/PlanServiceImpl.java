package com.project.jeans.service.plan;

import com.project.jeans.domain.plan.dao.PlanDAO;
import com.project.jeans.domain.plan.dto.PlanDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlanServiceImpl implements PlanService {
    private final PlanDAO planDAO;

    @Override
    public List<PlanDTO> selectPlanAll() {
        return planDAO. selectPlanAll();
    }
}
