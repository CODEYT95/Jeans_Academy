package com.project.jeans.domain.board.board3.dao;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board3.dto.Board3DTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface Board3DAO {

    //게시판 목록 조회(수강생)
    List<Board3DTO> findBoard3All();

    //게시판 목록 조회(강사님)
    List<Board3DTO> findBoard3ByTutor();

    //게시글 5개 조회
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