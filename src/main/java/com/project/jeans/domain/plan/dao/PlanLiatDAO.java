package com.project.jeans.domain.plan.dao;

import com.project.jeans.domain.plan.dto.PlanListDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PlanLiatDAO {
    List<PlanListDTO> selectPlanAll();
}
