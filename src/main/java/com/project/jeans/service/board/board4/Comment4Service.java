package com.project.jeans.service.board.board4;

import com.project.jeans.domain.board.board4.dto.Comment4DTO;

import java.util.List;
import java.util.Map;

public interface Comment4Service {

    //댓글 목록 조회
    public List<Comment4DTO> getComment4List(int board4_no);

    //댓글 입력
    public int writeComment4(Map<String,Object> map);

    //댓글 수정
    public int updateComment4(Map<String,Object> map);

    //댓글 삭제
    public int deleteComment4(Map<String,Object> map);




}