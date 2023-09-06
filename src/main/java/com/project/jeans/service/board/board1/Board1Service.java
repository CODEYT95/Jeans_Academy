package com.project.jeans.service.board.board1;

import com.project.jeans.domain.board.board1.dto.Board1DTO;

import java.util.List;
import java.util.Map;

public interface Board1Service {

    //반별 게시글 목록 조회
    public List<Board1DTO> getBoard1List();

    //반별 게시글 상세 조회
    public Board1DTO getBoard1Detail(int board1_no);

    //반별 게시글 작성
    public int writeBoard1(Map<String,Object> map);

    //반별 게시글 수정
    public int modifyBoard1(Map<String,Object> map);

    //반별 게시글 삭제
    public int deleteBoard1(Map<String,Object> map);

}