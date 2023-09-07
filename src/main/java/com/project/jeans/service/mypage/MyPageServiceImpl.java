package com.project.jeans.service.mypage;

import com.project.jeans.domain.member.dto.MemberDTO;
import com.project.jeans.domain.mypage.dao.MyPageDAO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    private MyPageDAO myPageDAO;

    @Override
    public List<MyPageDTO> selectMyPageAll(String member_id) {
        return myPageDAO.selectMyPageAll(member_id);
    }

    @Override
    public int addEvent(MyPageDTO myPageDTO) {
        return myPageDAO.addEvent(myPageDTO);
    }

    @Override
    public MemberDTO selectMember(String member_id) {
        return myPageDAO.selectMember(member_id);
    }
    @Override
    public List<MyPageDTO> selectboard(String member_id) {
        return myPageDAO.selectboard(member_id);
    }


}
