package com.project.jeans.domain.common.paging.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {

    //사용자가 선택한 페이지 정보를 담을 변수.
    private  int pageNum;
    private int pageNum1;
    private int pageNum2;
    private int pageNum3;
    private int countPerPage;
    private int countPerPage1;
    private int countPerPage2;
    private int countPerPage3;
    private int pagecnt;

    public int getPageStart(){
        return (pageNum-1) *countPerPage;
    }

    //검색에 필요한 데이터를 변수로 선언.
    private String keyword;
    private String condition;

    public PageDTO() {
        this.pageNum1 = 1;
        this.pageNum2 = 1;
        this.pageNum3 = 1;
        this.countPerPage1 = 5;
        this.countPerPage2 = 5;
        this.countPerPage3 = 5;
    }
}