package com.project.jeans.service.board.board2;

import com.project.jeans.domain.board.board2.dto.Comment2DTO;

import java.util.List;
import java.util.Map;

public interface Comment2Service {

    //댓글 목록 조회
    public List<Comment2DTO> getComment2List(int board2_no);

    //댓글 입력
    public int writeComment2(Map<String,Object> map);

    //댓글 수정
    public int updateComment2(Map<String,Object> map);

    //댓글 삭제
    public int deleteComment2(Map<String,Object> map);




}