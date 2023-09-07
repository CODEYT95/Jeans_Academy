package com.project.jeans.domain.calendar.dao;

import com.project.jeans.domain.calendar.dto.CalendarDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Mapper
@Repository
public interface CalendarDAO {

    //메인 일정 SELECT
    public ArrayList<CalendarDTO> calenList();

    //메인 일정 INSERT
    public int insertPlan(CalendarDTO calendarDTO);

}

