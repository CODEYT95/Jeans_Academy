package com.project.jeans.domain.board.board2.dao;

import com.project.jeans.domain.board.board2.dto.Comment2DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Comment2DAO {

    //댓글수정-진호오빠 구현


    //댓글 조회
    List<Comment2DTO> getComment2List(int board2_no);


    //댓글 상세 조회
    Map<String,Object> getComment2Detail(Map<String,Object> map);

    //댓글 작성
    int insertComment2(Map<String,Object> map);

    //댓글 수정
    int updateComment2(Map<String,Object> map);

    //댓글 삭제
    int deleteComment2(Map<String,Object> map);

}
