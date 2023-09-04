package com.project.jeans.domain.message.dao;

import com.project.jeans.domain.message.dto.MessageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MessageDAO {


    /* 메시지 목록 조회(수신함) */
    List<MessageDTO> selectReceiveMessage(String member_id);

    /* 메시지 목록 조회(발신함) */
    List<MessageDTO> selectSendMessage(String member_id);


    /* 메시지 작성(1.유저 정보)*/
//    int insertUserMessage();

    /* 메시지 작성(2.내용)*/
//    int insertContentMessage();

    /* 메시지 상세 조회 */
//    MessageDTO selectMessageDetail();

    /* 메시지 삭제 (수신함) */
//    int deleteReceiveMessage();

    /* 메시지 삭제 (발신함) */
//    int deleteSendMessage();


}
