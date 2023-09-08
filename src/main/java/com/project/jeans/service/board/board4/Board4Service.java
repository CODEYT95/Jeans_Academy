package com.project.jeans.service.board.board4;

import com.project.jeans.domain.board.board2.dto.Board2DTO;
import com.project.jeans.domain.board.board4.dto.Board4DTO;

import java.util.List;
import java.util.Map;

public interface Board4Service {

    //반별 게시글 목록 조회
    public List<Board4DTO> getBoard4List();

    //게시판 목록 조회(강사님)
    public List<Board4DTO> findBoard4ByTutor();

    //반별 게시글 목록 5개 조회
    public List<Board4DTO> findBoard4List();
    //반별 게시글 상세 조회
    public Board4DTO getBoard4Detail(int board4_no);

    //반별 게시글 작성
    public int writeBoard4(Map<String,Object> map);

    //반별 게시글 수정
    public int modifyBoard4(Map<String,Object> map);

    //반별 게시글 삭제
    public int deleteBoard4(Map<String,Object> map);

}