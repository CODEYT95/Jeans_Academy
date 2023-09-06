package com.project.jeans.service.board.board3;

import com.project.jeans.domain.board.board3.dao.Comment3DAO;
import com.project.jeans.domain.board.board3.dto.Comment3DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Comment3ServiceImpl implements Comment3Service {

    private final Comment3DAO comment3DAO;

    //댓글 목록 조회
    @Override
    public List<Comment3DTO> getComment3List(int board3_no){
        List<Comment3DTO> comment3DTOList = comment3DAO.getComment3List(board3_no);
        return comment3DTOList;
    }

    //댓글 입력
    @Override
    public int writeComment3(Map<String,Object> map){
        return comment3DAO.insertComment3(map);
    }

    //댓글 수정
    public int updateComment3(Map<String,Object> map){
        return comment3DAO.updateComment3(map);
    }

    //댓글 삭제
    @Override
    public int deleteComment3(Map<String,Object> map){
        return comment3DAO.deleteComment3(map);
    }


}
