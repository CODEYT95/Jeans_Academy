package com.project.jeans.service.board.board2;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board2.dto.Board2DTO;

import java.util.List;
import java.util.Map;

public interface Board2Service {

    //반별 게시글 목록 조회
    public List<Board2DTO> getBoard2List();

    //게시판 목록 조회(강사님)
    public List<Board2DTO> findBoard2ByTutor();

    //반별 게시글 목록 5개 조회
    public List<Board2DTO> findBoard2List();

    //반별 게시글 상세 조회
    public Board2DTO getBoard2Detail(int board2_no);

    //반별 게시글 작성
    public int writeBoard2(Map<String,Object> map);

    //반별 게시글 수정
    public int modifyBoard2(Map<String,Object> map);

    //반별 게시글 삭제
    public int deleteBoard2(Map<String,Object> map);

}