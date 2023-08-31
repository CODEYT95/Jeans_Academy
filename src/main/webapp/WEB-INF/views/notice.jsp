<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>웹 페이지 제목</title>
</head>
<body>
<h2>Hello JSP!</h2>
<h3>${name}</h3>
<div>JSP List Test</div>
<c:forEach var="item" items="${list}" varStatus="idx">
    ${idx.index}, ${item} <br />
</c:forEach>
</body>