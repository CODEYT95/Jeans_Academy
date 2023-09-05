package com.project.jeans.domain.mypage.dao;

import com.project.jeans.domain.mypage.dto.EventDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface EventDAO {
    List<EventDTO> selectMyPageAll();

    int addEvent(EventDTO eventDTO);
}
