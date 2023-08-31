package com.project.jeans.service.member;

import com.project.jeans.domain.member.dto.CodeDTO;
import com.project.jeans.domain.member.dto.MemberDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberService {
    //현재 회원 조회
    public List<HashMap<String,Object>> getShowMember(HashMap<String,Object>map);
  
    //탈퇴 회원 조회
    public List<HashMap<String,Object>> getHiddenMember(HashMap<String,Object>map);
 
    //수강생 회원가입
    public int insertStudent(MemberDTO memberDTO);
    
    //강사님 회원가입
    public int insertTeacher(MemberDTO memberDTO);

    //아이디 중복 체크
    public int idDuplicate(String member_id);

    //전화번호 중복 체크
    public String phoneDuplicate(String member_phone);

    //강사번호 조회
    public int codeCheck(String code);

    //강사번호 중복 체크
    public int codeDuplicate(String member_code);

    //요청 회원 조회
    public List<HashMap<String,Object>> getNoAccept(HashMap<String,Object>map);
    
    // 회원가입 요청 처리
    public int updateAccept(Map<String, Object> map);
}
