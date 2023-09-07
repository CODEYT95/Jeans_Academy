package com.project.jeans.service.mypage;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;

import java.util.List;

public interface MyPageService {

    List<MyPageDTO> selectMyPageAll(String member_id);

    int addEvent(MyPageDTO myPageDTO);
    MemberDTO selectMember(String member_id);

    List<MyPageDTO> selectboard (String member_id);

}
