package com.project.jeans.service.board.board3;

import com.project.jeans.domain.board.board3.dto.Comment3DTO;

import java.util.List;
import java.util.Map;

public interface Comment3Service {

    //댓글 목록 조회
    public List<Comment3DTO> getComment3List(int board3_no);

    //댓글 입력
    public int writeComment3(Map<String,Object> map);

    //댓글 수정
    public int updateComment3(Map<String,Object> map);

    //댓글 삭제
    public int deleteComment3(Map<String,Object> map);




}