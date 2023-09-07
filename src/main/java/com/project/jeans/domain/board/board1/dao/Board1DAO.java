package com.project.jeans.domain.board.board1.dao;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Board1DAO {

    //게시판 목록 조회
    List<Board1DTO> findBoard1All();

    //게시글 4개 조회
    List<Board1DTO> findBoard1List();

    //게시글 상세 조회
    Board1DTO findBoard1ByNo(int board1_no);

    //게시글 작성
    int insertBoard1(Map<String, Object> map);

    //게시글 수정
    int updateBoard1(Map<String, Object> map);

    //게시글 삭제
    int deleteBoard1(Map<String, Object> map);
}