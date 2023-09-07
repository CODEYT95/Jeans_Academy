package com.project.jeans.domain.common.paging.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageCreate {

    private PageDTO paging1;
    private PageDTO paging2;
    private PageDTO paging3;
    private int articleTotalCount1;
    private int articleTotalCount2;
    private int articleTotalCount3;
    private int endPage1;
    private int endPage2;
    private int endPage3;
    private int beginPage1;
    private int beginPage2;
    private int beginPage3;
    private boolean prev1;
    private boolean prev2;
    private boolean prev3;
    private boolean next1;
    private boolean next2;
    private boolean next3;

    private final int buttonNum = 5;


    private void calcDataOfPage1() {

        endPage1 = (int) (Math.ceil(paging1.getPageNum1() / (double) buttonNum) * buttonNum);

        beginPage1 = (endPage1 - buttonNum) + 1;

        prev1 = (beginPage1 == 1) ? false : true;

        next1 = articleTotalCount1 <= (endPage1 * paging1.getCountPerPage1()) ? false : true;

        if (!next1) {
            endPage1 = (int) Math.ceil(articleTotalCount1 / (double) paging1.getCountPerPage1());
        }

    }
    private void calcDataOfPage2() {

        endPage2 = (int) (Math.ceil(paging2.getPageNum2() / (double) buttonNum) * buttonNum);

        beginPage2 = (endPage2 - buttonNum) + 1;

        prev2 = (beginPage2 == 1) ? false : true;

        next2 = articleTotalCount2 <= (endPage2 * paging2.getCountPerPage2()) ? false : true;

        if (!next2) {
            endPage2 = (int) Math.ceil(articleTotalCount2 / (double) paging2.getCountPerPage2());
        }

    }
    private void calcDataOfPage3() {

        endPage3 = (int) (Math.ceil(paging3.getPageNum3() / (double) buttonNum) * buttonNum);

        beginPage3 = (endPage3 - buttonNum) + 1;

        prev3 = (beginPage3 == 1) ? false : true;

        next3 = articleTotalCount3 <= (endPage3 * paging3.getCountPerPage3()) ? false : true;

        if (!next3) {
            endPage3 = (int) Math.ceil(articleTotalCount3 / (double) paging3.getCountPerPage3());
        }

    }

    public void setArticleTotalCount1(int articleTotalCount1) {
        this.articleTotalCount1 = articleTotalCount1;
        calcDataOfPage1();
    }
    public void setArticleTotalCount2(int articleTotalCount2) {
        this.articleTotalCount2 = articleTotalCount2;
        calcDataOfPage2();
    }
    public void setArticleTotalCount3(int articleTotalCount3) {
        this.articleTotalCount3 = articleTotalCount3;
        calcDataOfPage3();
    }
}
