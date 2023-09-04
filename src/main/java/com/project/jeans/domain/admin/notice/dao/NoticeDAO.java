package com.project.jeans.domain.admin.notice.dao;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface NoticeDAO {

    //공지사항 전체조회
    List<NoticeDTO> selectAll();
    //공지사항 상세보기
    List<NoticeDTO> noticeDetail(int notice_no);

    //공지사항 INSERT
    int insertNotice(NoticeDTO noticeDTO);
    //공지사항 isShow 'N'으로 바꾸기
    int isShowNotice(int notice_no);

    List<NoticeDTO> findNoticeAll();
}
