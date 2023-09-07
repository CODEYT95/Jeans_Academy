package com.project.jeans.domain.board.board3.dao;

import com.project.jeans.domain.board.board2.dto.Board2DTO;
import com.project.jeans.domain.board.board3.dto.Board3DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Board3DAO {

    //게시판 목록 조회
    List<Board3DTO> findBoard3All();

    //게시글 5개조회
    List<Board3DTO> findBoard3List();


    //게시글 상세 조회
    Board3DTO findBoard3ByNo(int board3_no);

    //게시글 작성
    int insertBoard3(Map<String, Object> map);

    //게시글 수정
    int updateBoard3(Map<String, Object> map);

    //게시글 삭제
    int deleteBoard3(Map<String, Object> map);
}