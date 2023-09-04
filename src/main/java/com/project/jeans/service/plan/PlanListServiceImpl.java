package com.project.jeans.service.plan;

import com.project.jeans.domain.plan.dao.PlanLiatDAO;
import com.project.jeans.domain.plan.dto.PlanListDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlanListServiceImpl implements PlanListService {
    private final PlanLiatDAO planDAO;

    @Override
    public List<PlanListDTO> selectPlanAll() {
        return planDAO. selectPlanAll();
    }
}
