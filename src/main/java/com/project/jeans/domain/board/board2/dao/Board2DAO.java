package com.project.jeans.domain.board.board2.dao;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board2.dto.Board2DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Board2DAO {

    //게시판 목록 조회(수강생)
    List<Board2DTO> findBoard2All();

    //게시판 목록 조회(강사님)
    List<Board2DTO> findBoard2ByTutor();

    //게시글 5개조회
    List<Board2DTO> findBoard2List();

    //게시글 상세 조회
    Board2DTO findBoard2ByNo(int board2_no);

    //게시글 작성
    int insertBoard2(Map<String, Object> map);

    //게시글 수정
    int updateBoard2(Map<String, Object> map);

    //게시글 삭제
    int deleteBoard2(Map<String, Object> map);
}