package com.project.jeans.service.board.board1;

import com.project.jeans.domain.board.board1.dao.Comment1DAO;
import com.project.jeans.domain.board.board1.dto.Comment1DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Comment1ServiceImpl implements Comment1Service{

    private final Comment1DAO comment1DAO;

    //댓글 목록 조회
    @Override
    public List<Comment1DTO> getComment1List(int board1_no){
        List<Comment1DTO> comment1DTOList = comment1DAO.getComment1List(board1_no);
        return comment1DTOList;
    }

    //댓글 입력
    @Override
    public int writeComment1(Map<String,Object> map){
        return comment1DAO.insertComment1(map);
    }

    //댓글 수정
    public int updateComment1(Map<String,Object> map){
        return comment1DAO.updateComment1(map);
    }

    //댓글 삭제
    @Override
    public int deleteComment1(Map<String,Object> map){
        return comment1DAO.deleteComment1(map);
    }


}
