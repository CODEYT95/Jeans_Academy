package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
    private final NoticeDAO noticeDAO;
    @Override
    public List<NoticeDTO> selectAll() {
        return noticeDAO.selectAll();
    }

    //공지사항 INSERT
    @Override
    public NoticeDTO insertNotice() {
        return noticeDAO.insertNotice();
    }
}
