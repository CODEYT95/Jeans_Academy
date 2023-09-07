package com.project.jeans.service.board.board4;

import com.project.jeans.domain.board.board4.dao.Comment4DAO;
import com.project.jeans.domain.board.board4.dto.Comment4DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Comment4ServiceImpl implements Comment4Service {

    private final Comment4DAO comment4DAO;

    //댓글 목록 조회
    @Override
    public List<Comment4DTO> getComment4List(int board4_no){
        List<Comment4DTO> comment4DTOList = comment4DAO.getComment4List(board4_no);
        return comment4DTOList;
    }

    //댓글 입력
    @Override
    public int writeComment4(Map<String,Object> map){
        return comment4DAO.insertComment4(map);
    }

    //댓글 수정
    public int updateComment4(Map<String,Object> map){
        return comment4DAO.updateComment4(map);
    }

    //댓글 삭제
    @Override
    public int deleteComment4(Map<String,Object> map){
        return comment4DAO.deleteComment4(map);
    }


}
