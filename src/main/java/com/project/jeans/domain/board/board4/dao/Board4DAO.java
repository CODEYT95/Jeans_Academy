package com.project.jeans.domain.board.board4.dao;

import com.project.jeans.domain.board.board4.dto.Board4DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Board4DAO {

    //게시판 목록 조회
    List<Board4DTO> findBoard4All();
    //게시판 목록 5개 조회
    List<Board4DTO> findBoard4List();
    //게시글 상세 조회
    Board4DTO findBoard4ByNo(int board4_no);

    //게시글 작성
    int insertBoard4(Map<String, Object> map);

    //게시글 수정
    int updateBoard4(Map<String, Object> map);

    //게시글 삭제
    int deleteBoard4(Map<String, Object> map);
}