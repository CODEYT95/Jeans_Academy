package com.project.jeans.domain.mypage.dao;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MyPageDAO {
    int addEvent(MyPageDTO myPageDTO);
    List<MyPageDTO> selectEvent(String member_id);

    MemberDTO selectMember(String member_id);

    List<MyPageDTO> selectboard(String member_id);

    List<MyPageDTO> selectQA(String member_id);

    //마이페이지 일정 삭제
    int eventDelete(int mypage_no);

    //출석체크
    int addAttend(MyPageDTO myPageDTO);

    //출석체크 불러오기
    MyPageDTO loadAttend(String member_id);
}
