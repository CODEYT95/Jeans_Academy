package com.project.jeans.domain.admin.notice.dao;

import com.project.jeans.domain.admin.notice.dto.NReplyDTO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface NoticeDAO {

    //공지사항 전체조회
    List<NoticeDTO> selectAll();

    //공지사항 5개
    public List<NoticeDTO> selectFive();

    //공지사항 상세보기
    NoticeDTO noticeDetail(int notice_no);

    //공지사항 댓글
    List<NReplyDTO> nreplyDetail(int notice_no);

    //공지사항 댓글 입력
    int insertNReply(NReplyDTO nReplyDTO);

    //공지사항 댓글 갯수
    int nreplyCount(int notice_no);

    //공지사항 조회수 카운트
    int noticeCountUp(int notice_no);

    //공지사항 INSERT
    int insertNotice(NoticeDTO noticeDTO);

    //최근 작성한 공지사항
    int recentWrite(String member_id);

    //공지사항 isShow 'N'으로 바꾸기
    int isShowNotice(int notice_no);

    //댓글 isShow 'N'으로 바꾸기
    int isShowNreply(int comment_no);

    //공지사항 수정
    NoticeDTO noticeUpdate(NoticeDTO noticeDTO);

    //댓글 수정
    NReplyDTO nreplyUpdate(NReplyDTO nReplyDTO);

    List<NoticeDTO> findNoticeAll();
}
