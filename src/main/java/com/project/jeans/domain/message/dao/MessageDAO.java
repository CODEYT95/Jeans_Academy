package com.project.jeans.domain.message.dao;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.message.dto.MessageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MessageDAO {


    /* 메시지 목록 조회(수신함) */
    List<MessageDTO> selectReceiveMessage(String member_id);

    /* 메시지 목록 조회(발신함) */
    List<MessageDTO> selectSendMessage(String member_id);

    /* 메시지 상세 조회 */
    MessageDTO selectMessageDetail(int message_no);

    /* 메시지 작성 (수신자 목록) */
    public List<MemberDTO> selectMessageMemList();

    /* 메시지 작성 (내용)*/
    int insertContentMessage(Map<String,Object> map);

    /* 메시지 삭제 (수신함) */
    int deleteReceiveMessage(int message_no);

    /* 메시지 삭제 (발신함) */
    int deleteSendMessage(int message_no);

    /* 반별 멤버 조회 */
    List<MemberDTO> selectMemByClass(String member_class);


}
