package com.project.jeans.service.question;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.question.dao.QuestionDAO;
import com.project.jeans.domain.question.dto.QReplyDTO;
import com.project.jeans.domain.question.dto.QuestionDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService{
    private final QuestionDAO questionDAO;

    @Override
    public List<QuestionDTO> selectQuestionAll() {
        return questionDAO.selectQuestionAll();
    }

    @Override
    public int insertQuestion(QuestionDTO questionDTO) {
        return questionDAO.insertQuestion(questionDTO);
    }

    //공지사항 상세보기
    public QuestionDTO questionDetail(int question_no) {
        return questionDAO.questionDetail(question_no);
    }

    //QnA 댓글 목록
    public List<QReplyDTO> qreplyDetail(int question_no){return questionDAO.qreplyDetail(question_no);}

    //QnA 댓글 입력
    public int insertQReply(QReplyDTO qReplyDTO){return questionDAO.insertQReply(qReplyDTO);}

    //QnA 댓글 갯수
    public int qreplyCount(int question_no){return questionDAO.qreplyCount(question_no);}

    //QnA 조회수 카운트
    public int questionCountUp(int question_no){return questionDAO.questionCountUp(question_no);}

    //QnA INSERT
    public int insertQuestion(QReplyDTO qReplyDTO){return questionDAO.insertQuestion(qReplyDTO);}

    //최근 작성한 QnA
    public int recentWrite(String member_id){return questionDAO.recentWrite(member_id);}

    //QnA isShow 'N'으로 바꾸기
    public int isShowQuestion(int question_no){return questionDAO.isShowQuestion(question_no);}

    //QnA 댓글 isShow 'N'으로 바꾸기
    public int isShowQreply(int comment_no){return questionDAO.isShowQreply(comment_no);}

    //QnA 수정
    public int questionUpdate(QuestionDTO questionDTO){return questionDAO.questionUpdate(questionDTO);}

    //QnA 댓글 수정
    public int qreplyUpdate(QReplyDTO qReplyDTO){return questionDAO.qreplyUpdate(qReplyDTO);}
}
