package com.project.jeans.domain.member.dao;

import com.project.jeans.domain.common.paging.dto.PageDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MemberDAO {

    /*회원가입 관련-----------------------------------------------------*/
    //수강생 회원가입
    public int insertStudent(MemberDTO memberDTO);

    //강사님 회원가입
    public int insertTeacher(MemberDTO memberDTO);

    //전화번호 중복체크
    public int phoneDuplicate(String member_phones);

    //강사코드 조회
    public int codeCheck(String code);

    //강사코드 중복체크
    public int codeDuplicate(String member_code);

    //아이디 중복체크
    public int idDuplicate(String member_id);


    /*로그인 관련-----------------------------------------------------*/
    //로그인 유효성 검사 관련 요청 처리 전 회원 조회
    public int noAccept(String member_id);

    //회원 타입 조회
    public String memberType(String member_id);

    //아이디 찾기
    public String findId(MemberDTO memberDTO);

    //비밀번호 찾기
    public String findPw(MemberDTO memberDTO);

    // 비밀번호 수정
    int updatePw(MemberDTO memberDTO);

    //강사님 로그인 처리
    public int loginTeacher(MemberDTO memberDTO);

    //수강생 로그인 처리
    public int loginStudent(MemberDTO memberDTO);


    //회원 정보 가져오기(세션)
    public MemberDTO getMemberInfo(String member_id);


    /*관리자 관련-----------------------------------------------------------*/
    //페이징 처리 관련 코드-----------------------------------------------
    //현재 회원 조회
    List<MemberDTO> getShowMember(@Param("page") int page, @Param("size") int size, @Param("condition") String condition, @Param("keyword") String keyword);
    int getShowMemberCount();
    int getShowMemberCountWithSearch(@Param("condition") String condition, @Param("keyword") String keyword);


    //탈퇴 회원 조회
    List<MemberDTO> getHiddenMember(@Param("page") int page, @Param("size") int size, @Param("condition") String condition, @Param("keyword") String keyword);
    int getHiddenMemberCount();
    int getHiddenMemberCountWithSearch(@Param("condition") String condition, @Param("keyword") String keyword);

    //요청 회원 조회
    List<MemberDTO> getNoAcceptMember(@Param("page") int page, @Param("size") int size, @Param("condition") String condition, @Param("keyword") String keyword);
    int getNoAcceptMemberCount();
    int getNoAcceptMemberCountWithSearch(@Param("condition") String condition, @Param("keyword") String keyword);

    //회원 숨기기
    int updateMember(String member_id);

    //회원 보이기
    int refreshMember(String member_id);

    //회원 정보 수정하기
    int modifyMemberInfo(MemberDTO memberDTO);

    //회원 완전 삭제
    int deleteMember(String member_id);

    // 요청 처리
    public int acceptMember(String member_id);
}
