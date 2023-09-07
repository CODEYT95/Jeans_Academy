package com.project.jeans.domain.board.board4.dao;

import com.project.jeans.domain.board.board4.dto.Comment4DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Comment4DAO {

    //댓글수정-진호오빠 구현


    //댓글 조회
    List<Comment4DTO> getComment4List(int board4_no);


    //댓글 상세 조회
    Map<String,Object> getComment4Detail(Map<String,Object> map);

    //댓글 작성
    int insertComment4(Map<String,Object> map);

    //댓글 수정
    int updateComment4(Map<String,Object> map);

    //댓글 삭제
    int deleteComment4(Map<String,Object> map);

}
