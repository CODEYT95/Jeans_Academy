package com.project.jeans.service.board.board1;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board1.dao.Board1DAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Board1ServiceImpl implements Board1Service {

    private final Board1DAO board1DAO;

    //반별 게시판 목록 조회
    @Override
    public List<Board1DTO> getBoard1List(){
        List<Board1DTO> board1DTOList = board1DAO.findBoard1All();
        return board1DTOList;
    }

    //반별 게시글 상세 조회
    @Override
    public Board1DTO getBoard1Detail(int board1_no){
        Board1DTO board1Detail = board1DAO.findBoard1ByNo(board1_no);
        return board1Detail;
    }

    //반별 게시글 작성
    @Override
    public int writeBoard1(Map<String,Object> map){return board1DAO.insertBoard1(map);}
    //반별 게시글 수정
    @Override
    public int modifyBoard1(Map<String,Object> map){
        return board1DAO.updateBoard1(map);
    }

    //반별 게시글 삭제
    @Override
    public int deleteBoard1(Map<String,Object> map){
        return board1DAO.deleteBoard1(map);
    }

}
