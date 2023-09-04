package com.project.jeans.service.mypage;

import com.project.jeans.domain.mypage.dao.MyPageDAO;
import com.project.jeans.domain.mypage.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
    private final MyPageDAO myPageDAO;

    @Override
    public List<MyPageDTO> selectMyPageAll() {
        return myPageDAO. selectMyPageAll();
    }
}
