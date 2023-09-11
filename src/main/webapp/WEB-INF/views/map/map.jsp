<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>찾아오시는 길</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/map/map.js"></script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

    <div class="main--content">
        <div id="map" style="width:500px;height:400px;"></div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf85ffee9f3e752aea6e0401c15c8b6a"></script>
        <script>
            var map;
            $(document).ready(function() {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.49961203121169, 127.03046618600102), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

            map = new kakao.maps.Map(mapContainer, mapOption);
            map.setDraggable(false);
            // 마커가 표시될 위치입니다
            var markerPosition  = new kakao.maps.LatLng(37.49961203121169, 127.03046618600102);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            var iwContent = '<div style="padding: 5px;text-align: center;margin-left: 15px;">중앙정보 처리학원 <br><div style="display: flex;"><a href="https://map.kakao.com/link/map/중앙정보 처리학원,37.49961203121169, 127.03046618600102" style="color: white;border-radius: 7px;width: 62px;display: flex;height: 23px;font-size: 16px;border: 1px solid;background-color: #5073FB;flex-wrap: nowrap;flex-direction: row-reverse;justify-content: space-around;" target="_blank">크게보기</a> <a href="https://map.kakao.com/link/to/중앙정보 처리학원,37.49961203121169, 127.03046618600102" style="color: white;border-radius: 7px;display: flex;height: 23px;width: 47px;border: 1px solid;background-color: #5073FB;justify-content: center;" target="_blank">길찾기</a></div></div>',
                iwPosition = new kakao.maps.LatLng(37.49961203121169, 127.03046618600102); //인포윈도우 표시 위치입니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });

            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker);
            });
            function setDraggable(draggable) {
            // 마우스 드래그로 지도 이동 가능여부를 설정합니다
            map.setDraggable(false);
            }
        </script>

    </div>

</body>
</html>