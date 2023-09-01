package com.project.jeans.domain.plan.dao;

import com.project.jeans.domain.plan.dto.PlanDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PlanDAO {
    List<PlanDTO> selectPlanAll();

    public int insertPlan(PlanDTO planDTO);
}
