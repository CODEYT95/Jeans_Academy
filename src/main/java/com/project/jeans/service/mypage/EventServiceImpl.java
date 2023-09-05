package com.project.jeans.service.mypage;

import com.project.jeans.domain.mypage.dao.EventDAO;
import com.project.jeans.domain.mypage.dto.EventDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {

    @Autowired
    private EventDAO eventDAO;

    @Override
    public List<EventDTO> selectMyPageAll() {
        return eventDAO.selectMyPageAll();
    }

    @Override
    public int addEvent(EventDTO eventDTO) {
        return eventDAO.addEvent(eventDTO);
    }
}
