package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
    private final NoticeDAO noticeDAO;
    @Override
    public List<NoticeDTO> selectAll() {
        return noticeDAO.selectAll();
    }

    @Override
    public List<NoticeDTO> selectFive() {
        return noticeDAO.selectFive();
    }


    //공지사항 INSERT
    @Override
    public int insertNotice(NoticeDTO noticeDTO) {
        return noticeDAO.insertNotice(noticeDTO);
    }

    //공지사항 isShow N으로 바꾸기
    @Override
    public int noticeIsshow(int notice_no) {
        return noticeDAO.noticeIsshow(notice_no);
    }

}
