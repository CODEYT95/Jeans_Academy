package com.project.jeans.domain.board.board3.dao;

import com.project.jeans.domain.board.board3.dto.Comment3DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Comment3DAO {

    //댓글 조회
    List<Comment3DTO> getComment3List(int board3_no);

    //댓글 상세 조회
    Map<String,Object> getComment3Detail(Map<String,Object> map);

    //댓글 작성
    int insertComment3(Map<String,Object> map);

    //댓글 수정
    int updateComment3(Map<String,Object> map);

    //댓글 삭제
    int deleteComment3(Map<String,Object> map);

}
