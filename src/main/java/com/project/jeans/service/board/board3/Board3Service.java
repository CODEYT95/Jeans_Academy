package com.project.jeans.service.board.board3;

import com.project.jeans.domain.board.board3.dto.Board3DTO;

import java.util.List;
import java.util.Map;

public interface Board3Service {

    //반별 게시글 목록 조회
    public List<Board3DTO> getBoard3List();

    //게시판 목록 조회(강사님)
    public List<Board3DTO> findBoard3ByTutor();

    //반별 게시글 목록 5개 조회
    public List<Board3DTO> findBoard3List();

    //반별 게시글 상세 조회
    public Board3DTO getBoard3Detail(int board3_no);

    //반별 게시글 작성
    public int writeBoard3(Map<String,Object> map);

    //반별 게시글 수정
    public int modifyBoard3(Map<String,Object> map);

    //반별 게시글 삭제
    public int deleteBoard3(Map<String,Object> map);

}