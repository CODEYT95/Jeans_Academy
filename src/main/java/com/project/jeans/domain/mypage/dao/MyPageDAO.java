package com.project.jeans.domain.mypage.dao;

import com.project.jeans.domain.mypage.dto.MyPageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MyPageDAO {
    List<MyPageDTO> selectMyPageAll();
}
