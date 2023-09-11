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
    private int countPerPage;
    private int pagecnt;

    public int getPageStart(){
        return (pageNum-1) *countPerPage;
    }

    //검색에 필요한 데이터를 변수로 선언.
    private String keyword;
    private String condition;

    }
