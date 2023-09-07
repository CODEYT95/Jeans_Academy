package com.project.jeans.service.board.board3;

import com.project.jeans.domain.board.board1.dto.Board1DTO;
import com.project.jeans.domain.board.board3.dao.Board3DAO;
import com.project.jeans.domain.board.board3.dto.Board3DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Board3ServiceImpl implements Board3Service {

    private final Board3DAO board3DAO;

    //반별 게시판 목록 조회
    @Override
    public List<Board3DTO> getBoard3List(){
        List<Board3DTO> board3DTOList = board3DAO.findBoard3All();
        return board3DTOList;
    }

    //반별 게시글 4개 조회
    @Override
    public List<Board3DTO> findBoard3List() {
        return board3DAO.findBoard3List();
    }

    //반별 게시글 상세 조회
    @Override
    public Board3DTO getBoard3Detail(int board3_no){
        Board3DTO board3Detail = board3DAO.findBoard3ByNo(board3_no);
        return board3Detail;
    }

    //반별 게시글 작성
    @Override
    public int writeBoard3(Map<String,Object> map){
        return board3DAO.insertBoard3(map);
    }

    //반별 게시글 수정
    @Override
    public int modifyBoard3(Map<String,Object> map){
        return board3DAO.updateBoard3(map);
    }

    //반결 게시글 삭제
    @Override
    public int deleteBoard3(Map<String,Object> map){
        return board3DAO.deleteBoard3(map);
    }

}