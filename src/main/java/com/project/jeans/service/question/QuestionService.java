package com.project.jeans.service.question;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.question.dto.QReplyDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;

import java.util.List;

public interface QuestionService {
    List<QuestionDTO> selectQuestionAll();

    public int insertQuestion(QuestionDTO questionDTO);

    //QnA 상세보기
    public QuestionDTO questionDetail(int question_no);

    //QnA 댓글 목록
    public List<QReplyDTO> qreplyDetail(int question_no);

    //QnA 댓글 입력
    public int insertQReply(QReplyDTO qReplyDTO);

    //QnA 댓글 갯수
    public int qreplyCount(int question_no);

    //QnA 조회수 카운트
    public int questionCountUp(int question_no);

    //QnA INSERT
    public int insertQuestion(QReplyDTO qReplyDTO);

    //최근 작성한 QnA
    public int recentWrite(String member_id);

    //QnA isShow 'N'으로 바꾸기
    public int isShowQuestion(int question_no);

    //QnA 댓글 isShow 'N'으로 바꾸기
    public int isShowQreply(int comment_no);

    //QnA 수정
    public int questionUpdate(QuestionDTO questionDTO);

    //QnA 댓글 수정
    public int qreplyUpdate(QReplyDTO qReplyDTO);
}
