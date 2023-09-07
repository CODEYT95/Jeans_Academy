package com.project.jeans.domain.board.board1.dao;

import com.project.jeans.domain.board.board1.dto.Comment1DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Comment1DAO {

    //댓글 조회
    List<Comment1DTO> getComment1List(int board1_no);

    //댓글 상세 조회
    Map<String,Object> getComment1Detail(Map<String,Object> map);

    //댓글 작성
    int insertComment1(Map<String,Object> map);

    //댓글 수정
    int updateComment1(Map<String,Object> map);

    //댓글 삭제
    int deleteComment1(Map<String,Object> map);

}
