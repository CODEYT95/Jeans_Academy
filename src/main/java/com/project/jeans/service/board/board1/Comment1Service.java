package com.project.jeans.service.board.board1;

import com.project.jeans.domain.board.board1.dto.Comment1DTO;

import java.util.List;
import java.util.Map;

public interface Comment1Service {

    //댓글 목록 조회
    public List<Comment1DTO> getComment1List(int board1_no);

    //댓글 상세 조회
    public Comment1DTO getComment1Detail(Map<String,Object> map);

    //댓글 입력
    public int writeComment1(Map<String,Object> map);

/*   //댓글 수정
    public int updateComment1(Map<String,Object> map);*/

    //댓글 삭제
    public int deleteComment1(Map<String,Object> map);




}
