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

    //공지사항 상세보기
    @Override
    public NoticeDTO noticeDetail(int notice_no){
     return noticeDAO.noticeDetail(notice_no);
    }
    //공지사항 댓글
    @Override
    public NoticeDTO nreplyDetail(int notice_no) { return noticeDAO.nreplyDetail(notice_no); }
    //공지사항 조회수 카운트
    public int noticeCountUp(int notice_no){return noticeDAO.noticeCountUp(notice_no);}

    //공지사항 INSERT
    @Override
    public int insertNotice(NoticeDTO noticeDTO) {
        return noticeDAO.insertNotice(noticeDTO);
    }

    //공지사항 isShow 'N'으로 바꾸기
    @Override
    public int isShowNotice(int notice_no) {
        return noticeDAO.isShowNotice(notice_no);
    }

}
