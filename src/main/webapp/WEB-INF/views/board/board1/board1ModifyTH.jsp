<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>게시물수정</title>
</head>
<body>
<div class="layout">
    <form th:action="@{/board/board1/modify/{no}(no=${~~.no}" method="post">
        <input name="title" type="text" th:value="#{~~~.title}">
        <textarea name="content" th:text="${~~~.content}"></textarea>
        <button type="submit">수정</button>
    </form>
</div>
</body>
</html>