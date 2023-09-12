package com.project.jeans.domain.common.paging.dto;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;
import com.project.jeans.domain.member.dto.MemberDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class PageDTO {

    private int total;  //총게시글수
    private List<MemberDTO> memberList;  // 목록 데이터
    private int currentPage; // 현재 페이지 번호
    private int totalPages;  // 총 페이지 수
    private int startPage;   // 시작 페이지 번호
    private int endPage;     // 끝 페이지 번호


    public PageDTO(int total, int currentPage, int size, List<MemberDTO> memberList){
        this.total=total;		//총게시글수
        this.currentPage=currentPage; //현재 페이지
        this.memberList=memberList;
        if(total==0) { //게시글이 존재하지 않는 경우
            totalPages=0;
            startPage=0;
            endPage=0;
        }else { //게시글이 존재하는 경우

            totalPages=total/size;	//총페이지수
            if(total%size>0) {
                totalPages++;
            }

            int modVal = currentPage%5;
            startPage=currentPage/5*5+1;
            if(modVal==0)  startPage=startPage-5;

            endPage=startPage+4;	//끝페이지-p649 33라인
            if(endPage>totalPages) endPage=totalPages;
        }//게시글이 존재하는 경우의 끝
    }
}