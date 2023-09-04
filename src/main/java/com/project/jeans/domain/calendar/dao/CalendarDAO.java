package com.project.jeans.domain.calendar.dao;

import com.project.jeans.domain.calendar.dto.CalendarDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Mapper
@Repository
public interface CalendarDAO {


    public ArrayList<CalendarDTO> calenList();
}
