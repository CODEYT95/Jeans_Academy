package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dao.NoticeDAO;
import com.project.jeans.domain.admin.notice.dto.NReplyDTO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
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

    //5개 보기
    @Override
    public List<NoticeDTO> selectFive() {
        return noticeDAO.selectFive();
    }

    //공지사항 페이징 목록
    @Override
    public List<NoticeDTO>getShowNotice(int page, int size){
        int offset = (page - 1) * size;
        return noticeDAO.getShowNotice(offset,size);
    }
    //공지사항 총 갯수
    @Override
    public int noticeCount(){return noticeDAO.noticeCount();}
    //공지사항 상세보기
    @Override
    public NoticeDTO noticeDetail(int notice_no){
     return noticeDAO.noticeDetail(notice_no);
    }

    //공지사항 댓글
    @Override
    public List<NReplyDTO> nreplyDetail(int notice_no) { return noticeDAO.nreplyDetail(notice_no);}

    //공지사항 댓글 입력
    @Override
    public int insertNReply(NReplyDTO nReplyDTO){return noticeDAO.insertNReply(nReplyDTO);}

    //공지사항 댓글 갯수
    @Override
    public int nreplyCount(int notice_no){return  noticeDAO.nreplyCount(notice_no);}

    //공지사항 조회수 카운트
    public int noticeCountUp(int notice_no){return noticeDAO.noticeCountUp(notice_no);}

    //공지사항 INSERT
    @Override
    public int insertNotice(NoticeDTO noticeDTO) {
        return noticeDAO.insertNotice(noticeDTO);
    }
    //최근 작성한 공지사항
    public int recentWrite(String member_id){return noticeDAO.recentWrite(member_id);}

    //공지사항 isShow 'N'으로 바꾸기
    @Override
    public int isShowNotice(int notice_no) {
        return noticeDAO.isShowNotice(notice_no);
    }

    //댓글 isShow 'N'으로 바꾸기
    @Override
    public int isShowNreply(int comment_no){return  noticeDAO.isShowNreply(comment_no);}

    //공지사항 수정
    @Override
    public int noticeUpdate(NoticeDTO noticeDTO){return noticeDAO.noticeUpdate(noticeDTO);}

    //댓글 수정
    @Override
    public int nreplyUpdate(NReplyDTO nReplyDTO){return noticeDAO.nreplyUpdate(nReplyDTO);}


}
