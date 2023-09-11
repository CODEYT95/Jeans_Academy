package com.project.jeans.domain.question.dao;

import com.project.jeans.domain.admin.notice.dto.NReplyDTO;
import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.question.dto.QReplyDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface QuestionDAO {
    List<QuestionDTO> selectQuestionAll();

    public int insertQuestion(QuestionDTO questionDTO);

    //QnA 상세보기
    QuestionDTO questionDetail(int question_no);

    //QnA 댓글
    List<QReplyDTO> qreplyDetail(int question_no);

    //QnA 댓글 입력
    int insertQReply(QReplyDTO qReplyDTO);

    //QnA 댓글 갯수
    int qreplyCount(int question_no);

    //QnA 조회수 카운트
    int questionCountUp(int question_no);

    //QnA INSERT
    int insertQuestion(QReplyDTO qReplyDTO);

    //최근 작성한 QnA
    int recentWrite(String member_id);

    //QnA isShow 'N'으로 바꾸기
    int isShowQuestion(int question_no);

    //QnA 댓글 isShow 'N'으로 바꾸기
    int isShowQreply(int comment_no);

    //QnA 수정
    int questionUpdate(QuestionDTO questionDTO);

    //QnA 댓글 수정
    int qreplyUpdate(QReplyDTO qReplyDTO);
}

