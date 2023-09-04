package com.project.jeans.service.message;

import com.project.jeans.domain.message.dao.MessageDAO;
import com.project.jeans.domain.message.dto.MessageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{

    private final MessageDAO messageDAO;

    /* 메시지 목록 조회(수신함) */
    @Override
    public List<MessageDTO> selectReceiveMessage(String member_id){
        List<MessageDTO> messageDTO = messageDAO.selectReceiveMessage(member_id);
        return messageDTO;
    }

    /* 메시지 목록 조회(발신함) */
    @Override
    public List<MessageDTO> selectSendMessage(String member_id){
        List<MessageDTO> messageDTO = messageDAO.selectSendMessage(member_id);
        return messageDTO;
    }

    /* 메시지 상세 조회 */
    //   @Override
    public MessageDTO selectMessageDetail(int message_no){
        MessageDTO messageDTO = messageDAO.selectMessageDetail(message_no);
        return messageDTO;
    }










    /* 메시지 작성(1.유저 정보)*/
//    @Override
/*    public int insertUserMessage(){
        return 0;
    }*/

    /* 메시지 작성(2.내용)*/
    //   @Override
/*
    public int insertContentMessage(){
        return 0;
    }
*/

    /* 메시지 삭제 (수신함) */
 //   @Override
/*
    public int deleteReceiveMessage(){
        return 0;
    }
*/

    /* 메시지 삭제 (발신함) */
 //   @Override
/*
    public int deleteSendMessage(){
        return 0;
    }
*/









}
