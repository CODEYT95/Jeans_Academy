package com.project.jeans.service.board.board4;

import com.project.jeans.domain.board.board4.dao.Board4DAO;
import com.project.jeans.domain.board.board4.dto.Board4DTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Board4ServiceImpl implements Board4Service {

    private final Board4DAO board4DAO;

    //반별 게시판 목록 조회
    @Override
    public List<Board4DTO> getBoard4List(){
        List<Board4DTO> board4DTOList = board4DAO.findBoard4All();
        return board4DTOList;
    }

    //게시판 목록 조회(강사님)
    public List<Board4DTO> findBoard4ByTutor(){
        List<Board4DTO> board4DTOList = board4DAO.findBoard4ByTutor();
        return board4DTOList;
    }

    //반별 게시글 목록 5개 조회
    @Override
    public List<Board4DTO> findBoard4List() {
        List<Board4DTO> findBoard4List = board4DAO.findBoard4List();
        return findBoard4List;
    }

    //반별 게시글 상세 조회
    @Override
    public Board4DTO getBoard4Detail(int board4_no){
        Board4DTO board4Detail = board4DAO.findBoard4ByNo(board4_no);
        return board4Detail;
    }

    //반별 게시글 작성
    @Override
    public int writeBoard4(Map<String,Object> map){
        return board4DAO.insertBoard4(map);
    }

    //반별 게시글 수정
    @Override
    public int modifyBoard4(Map<String,Object> map){
        return board4DAO.updateBoard4(map);
    }

    //반결 게시글 삭제
    @Override
    public int deleteBoard4(Map<String,Object> map){
        return board4DAO.deleteBoard4(map);
    }

}