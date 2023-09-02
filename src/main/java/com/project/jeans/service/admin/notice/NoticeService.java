package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;

import java.util.List;

public interface NoticeService {
    public List<NoticeDTO> selectAll();

    public  List<NoticeDTO> selectFive();
    //공지사항 INSERT
    public int insertNotice(NoticeDTO noticeDTO);

    //공지사항 isShow N으로 바꾸기
    public int noticeIsshow(int notice_no);
}
