package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dto.NReplyDTO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeService {
    //공지사항 전체조회
    public List<NoticeDTO> selectAll();

    //공지사항 5개
    public List<NoticeDTO> selectFive();
    //공지사항 페이징 목록
    public List<NoticeDTO>getShowNotice(@Param("page") int page, @Param("size") int size);
    //공지사항 총 갯수
    public int noticeCount();
    //공지사항 상세보기
    public NoticeDTO noticeDetail(int notice_no);

    //공지사항 댓글
    public List<NReplyDTO> nreplyDetail(int notice_no);

    //공지사항 댓글 입력
    public int insertNReply(NReplyDTO nReplyDTO);

    //공지사항 댓글 갯수
    public int nreplyCount(int notice_no);

    //공지사항 조회수 카운트
    public int noticeCountUp(int notice_no);

    //공지사항 INSERT
    public int insertNotice(NoticeDTO noticeDTO);

    //최근 작성한 공지사항
    public int recentWrite(String member_id);

    //공지사항 isShow 'N'으로 바꾸기
    public int isShowNotice(int notice_no);

    //댓글 isShow 'N'으로 바꾸기
    public int isShowNreply(int comment_no);

    //공지사항 수정
    public int noticeUpdate(NoticeDTO noticeDTO);

    //댓글 수정
    public int nreplyUpdate(NReplyDTO nReplyDTO);
}
