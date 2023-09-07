package com.project.jeans.domain.mypage.dao;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MyPageDAO {
    List<MyPageDTO> selectMyPageAll(String member_id);

    int addEvent(MyPageDTO myPageDTO);

    MemberDTO selectMember(String member_id);

    List<MyPageDTO> selectboard(String member_id);



}
