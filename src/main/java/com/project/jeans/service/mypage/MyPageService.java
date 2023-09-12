package com.project.jeans.service.mypage;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;

import java.util.List;

public interface MyPageService {

    int addEvent(MyPageDTO myPageDTO);
    List<MyPageDTO> selectEvent(String member_id);

    MemberDTO selectMember(String member_id);

    List<MyPageDTO> selectboard (String member_id);

    List<MyPageDTO> selectQA(String member_id);

    //마이페이지 일정 삭제
    int eventDelete(int mypage_no);

    //출석체크
    public int addAttend(MyPageDTO myPageDTO);

    //출석체크 불러오기
    public MyPageDTO loadAttend(String member_id);
}
