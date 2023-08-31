<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/board1Detail.css">
    <!--    <script type="text/javascript" src="../../../resources/js/board/board1.js"></script>-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>


    <script>
        $(document).ready(function() {
            let menu = $('.menu');
            let sidebar = $('.sidebar');
            let mainContent = $('.main--content');
            menu.click(function() {
                sidebar.toggleClass('active');
                mainContent.toggleClass('active');
            });
        });
    </script>



</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans:청바지:</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로 <span style="color:#5073FB">지</span>금!</h5>
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

        <div class="main-container">
            <form action="/board1/modify" method="get">
                <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                <button type="submit" class="button">수정</button>
            </form>
            <form action="/board1/delete" method="get">
                <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                <button type="submit" class="button">삭제</button>
            </form>
            <button type="button" class="button" onclick="location.href='/board1/list'">목록</button>
            <div class="title--conatiner">
                <div class="write-title">
                    <h2>게시글 목록</h2><br/>
                    <label>
                        <h4>${board1DTO.member_name}</h4>
                        <textarea name="board1_title">${board1DTO.board1_title}</textarea>
                    </label>
            </div>
            </div>
        </div>

        <div class="content-container">
            <div class="write-content">
                <span class="content-label">내용</span>
                <div class="content-textarea">${board1DTO.board1_content}</div>
            </div>
        </div>

        <div class="reply-container">
            <div>
                <form action="/comment1/write" method="post">
                    <input type="hidden" name="board1_no" value="${board1DTO.board1_no}">
                    <button type="submit" class="insert-reply">댓글 등록</button>

                        <textarea name="comment1_content" class="reply-insert" maxlength="300"></textarea>
                </form>
            </div>
            <div class="reply-content-container">
                <ul>
                    <c:forEach items="${commentDTOs}" var="commentDTOs">
                        <li>
                            <table>
                                <td><c:out value="${commentDTOs.comment1_content}"/></td>
                                <td>
                                    <form action="/comment1/delete" method="post">
                                        <input type="hidden" name="comment1_no" value="${commentDTOs.comment1_no}"/>
                                        <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                                        <button type="submit" class="button">삭제</button>
                                    </form>
                                </td>
                                <td><button type="button" class="button">수정</button></td>

                            </table>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</section>

</body>
</html>