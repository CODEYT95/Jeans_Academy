package com.project.jeans.service.mypage;

import com.project.jeans.domain.mypage.dto.EventDTO;

import java.util.List;

public interface EventService {

    List<EventDTO> selectMyPageAll();

    int addEvent(EventDTO eventDTO);
}
