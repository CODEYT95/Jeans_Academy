package com.project.jeans.domain.member.dao;

import com.project.jeans.domain.member.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MemberDAO {
    //현재 회원 조회
    public List<HashMap<String,Object>> getShowMember(HashMap<String,Object>map);

    //탈퇴 회원 조회
    public List<HashMap<String,Object>> getHiddenMember(HashMap<String,Object>map);

    //요청 처리중인 회원 조회
    public int noAccept(String member_id);


    //수강생 회원가입
    public int insertStudent(MemberDTO memberDTO);

    //강사님 회원가입
    public int insertTeacher(MemberDTO memberDTO);

    //강사님 로그인 처리
    public int loginTeacher(MemberDTO memberDTO);

    //수강생 로그인 처리
    public int loginStudent(MemberDTO memberDTO);

    //아이디 중복체크
    public int idDuplicate(String member_id);

    //회원 타입 조회
    public String memberType(String member_id);

    //전화번호 중복체크
    public int phoneDuplicate(String member_phones);

    //강사코드 조회
    public int codeCheck(String code);

    //강사코드 중복체크
    public int codeDuplicate(String member_code);

    //요청 회원 조회
    public List<HashMap<String,Object>> getNoAccept(HashMap<String,Object>map);

    // 요청 처리
    public int updateAccept(Map<String, Object> map);

}
