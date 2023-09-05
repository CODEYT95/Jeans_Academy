package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;

import java.util.List;

public interface NoticeService {
    //공지사항 전체조회
    public List<NoticeDTO> selectAll();
    //공지사항 상세보기
    public NoticeDTO noticeDetail(int notice_no);

    //공지사항 INSERT
    public int insertNotice(NoticeDTO noticeDTO);

    //공지사항 isShow 'N'으로 바꾸기
    public int isShowNotice(int notice_no);
}
