package com.project.jeans.service.board.board2;

import com.project.jeans.domain.board.board2.dao.Comment2DAO;
import com.project.jeans.domain.board.board2.dto.Comment2DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Comment2ServiceImpl implements Comment2Service {

    private final Comment2DAO comment2DAO;

    //댓글 목록 조회
    @Override
    public List<Comment2DTO> getComment2List(int board2_no){
        List<Comment2DTO> comment2DTOList = comment2DAO.getComment2List(board2_no);
        return comment2DTOList;
    }

    //댓글 입력
    @Override
    public int writeComment2(Map<String,Object> map){
        return comment2DAO.insertComment2(map);
    }

    //댓글 수정
    public int updateComment2(Map<String,Object> map){
        return comment2DAO.updateComment2(map);
    }

    //댓글 삭제
    @Override
    public int deleteComment2(Map<String,Object> map){
        return comment2DAO.deleteComment2(map);
    }


}
