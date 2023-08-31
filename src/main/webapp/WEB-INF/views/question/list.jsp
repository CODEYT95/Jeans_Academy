<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/question/list.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="http://cdn.jsdelivr.net/mojs/latest/mo.min.js"></script>
</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans:청바지:</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로
        <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <div class="picon bell">
                <i class="ri-notification-2-line"></i>
            </div>
            <div class="picon chat">
                <i class="ri-mail-line"></i>
            </div>
            <div class="picon profile">
                <span>???님 오늘도 파이팅하세요:미소짓는_얼굴:</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="#" id="active--link">
                    <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="#">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                    <span class="sidebar--item">마이페이지</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-9"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">로그아웃</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="main--content">
        <div class="title-box">
            <div class="title">Q&A
            </div>
        </div>
        <div class="search-box">
            <input type="text" class="search-input" placeholder="검색어를 입력하세요">
            <button class="search-button"><i class="ri-search-line"></i></button>
            <div>
                <button class="write-button">글작성</button>
            </div>
        </div>
        <div class="box-list">
            <c:forEach items="${questionList}" var="question" varStatus="status">
                <div class="box box${(status.index % 4) + 1}">
                    <h2>
                        <c:out value="${question.question_title}"/>
                    </h2>
                    <p>
                        <c:out value="${question.question_content}"/>
                    </p>
                </div>

                <c:if test="${status.index % 4 == 3 or status.last}">
                    <div style="clear: both;"></div>
                </c:if>
            </c:forEach>
        </div>
        <!----------box-list정렬-------------->
        <script>
            var boxCount = 0;
            var boxes = document.querySelectorAll('.box1');

            if (boxes.length > 0) {
                if (${status.index} % 4 === 3 || ${status.last}) {
                    boxes[boxCount].parentNode.classList.add('box-row');
                    boxCount++;
                }
            }
        </script>
        <!-----------box-list정렬 끝----------->
    </div>
</section>
<!------------------검색기능--------------->
<script>
    $(document).ready(function() {
        let originalBoxes = $('.box-list .box').clone(); // 처음 로드된 박스들을 복사하여 저장

        $('.search-button').click(function() {
            performSearch();
        });

        $('.search-input').keyup(function(event) {
            if (event.keyCode === 13) { // Enter 키를 눌렀을 때
                performSearch();
            }
        });

        // 박스 클릭 이벤트 리스너 추가
        $('.box-list .box').click(function() {
            let boxTitle = $(this).find('h2').text();
            let boxContent = $(this).find('p').text();
            let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
            window.location.href = detailURL;
        });

        function performSearch() {
            let searchKeyword = $('.search-input').val().toLowerCase();
            let matchingBoxes = [];

            originalBoxes.each(function() {
                let boxTitle = $(this).find('h2').text().toLowerCase();
                if (boxTitle.includes(searchKeyword)) {
                    matchingBoxes.push($(this));
                }
            });

            $('.box-list').empty(); // 이전 검색 결과를 제거

            matchingBoxes.forEach(function(box) {
                $('.box-list').append(box);
            });
                   // 필터링된 결과에 대한 박스 클릭 이벤트 리스너 추가
        $('.box-list .box').click(function() {
            let boxTitle = $(this).find('h2').text();
            let boxContent = $(this).find('p').text();
            let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
            window.location.href = detailURL;
        });
    }
});
</script>
<!------------------검색기능 끝--------------->
</body>
</html>