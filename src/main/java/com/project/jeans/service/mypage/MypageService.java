package com.project.jeans.service.mypage;

import com.project.jeans.domain.mypage.dto.MyPageDTO;

import java.util.List;

public interface MypageService {
   List<MyPageDTO> selectMyPageAll();
}
