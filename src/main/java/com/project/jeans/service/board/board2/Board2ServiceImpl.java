package com.project.jeans.service.board.board2;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board2.dao.Board2DAO;
import com.project.jeans.domain.board.board2.dto.Board2DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Board2ServiceImpl implements Board2Service {

    private final Board2DAO board2DAO;

    //반별 게시판 목록 조회
    @Override
    public List<Board2DTO> getBoard2List(){
        List<Board2DTO> board2DTOList = board2DAO.findBoard2All();
        return board2DTOList;
    }

    //반별 게시글 4개 조회
    @Override
    public List<Board2DTO> findBoard2List() {
        return board2DAO.findBoard2List();
    }


    //반별 게시글 상세 조회
    @Override
    public Board2DTO getBoard2Detail(int board2_no){
        Board2DTO board2Detail = board2DAO.findBoard2ByNo(board2_no);
        return board2Detail;
    }

    //반별 게시글 작성
    @Override
    public int writeBoard2(Map<String,Object> map){
        return board2DAO.insertBoard2(map);
    }

    //반별 게시글 수정
    @Override
    public int modifyBoard2(Map<String,Object> map){
        return board2DAO.updateBoard2(map);
    }

    //반결 게시글 삭제
    @Override
    public int deleteBoard2(Map<String,Object> map){
        return board2DAO.deleteBoard2(map);
    }

}