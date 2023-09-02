<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset='utf-8'/>
    <title>메인</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- 슬라이드-->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"
    />

    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        body {
            position: relative;
            width: 100%;
        }
        .header {
            position: fixed;
            z-index: 9999;
            height: 60px;
            width: 100%;
            display: flex;
            align-items: center;
            border-bottom: 2px solid #F1F1F1;
            background-color: #ebf3ff;
            border: none;
            box-shadow: 11px 3px 16px #0000000d;
        }
        .logo {
            display: flex;
            align-items: center;
            width: 300px;
            padding-left: 40px;
        }
        .logo span {
            color: #5073FB;
        }
        .search--notification--profile {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            width: calc(100% - 300px);
            padding: 0 40px;
        }
        .notification--profile {
            display: flex;
            align-items: center;
        }
        .picon {
            margin-left: 20px;
            font-size: 1.1rem;
            padding: 5px;
            border-radius: 5px;
        }
        .bell {
            color: #F1D243;
            background-color: rgba(241, 210, 67, .2);
        }
        .chat {
            color: #70D7A5;
            background-color: rgba(112, 215, 165, .2);
        }
        .profile {
            position: relative;
            width: 100%;
            overflow: auto;
        }
        .profile span{
        font-family: 'Do Hyeon', sans-serif;
        }
        img {

            width: 100%;
            height: 100%;
            border-radius:24px;
        }
        .main {
            position: relative;
            width: 100%;
            min-height: calc(100vh - 60px);
        }
        /* sidebar */
        .sidebar--item{
        font-family: 'Do Hyeon', sans-serif;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 300px;
            background-color: #f2f7fb;
            border: none;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: .5s;
            overflow-y: scroll;
            box-shadow: 11px 3px 16px #0000000d;
        }
	    .sidebar--items{
            margin-top: 60px;
        }
        .sidebar::-webkit-scrollbar {
            display: none;
        }
        .sidebar.active {
            width: 103px;
            overflow-y: scroll;
        }
        .sidebar.active::-webkit-scrollbar{
            display: none;
        }
        .sidebar.active .sidebar--item {
            display: none;
        }
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
        }
        .sidebar--items a,
        .sidebar--bottom-items a {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 1.1rem;
            color: #000;
            padding: 10px;
            border-radius: 10px;
        }
        .sidebar--items a:hover,
        .sidebar--bottom-items a:hover {
            background-color: #5073FB;
            color: #fff;
        }
        #active--link {
            background-color: #5073FB;
            color: #fff;
        }
        .sidebar--bottom-items li:last-child a {
            margin-bottom: 0;
        }
        .icon {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            font-size: 1.3rem;
        }
        .icon-0 {
            color: #5073FB;
        }
        .icon-1 {
            color: #C5BC58;
        }
        .icon-2 {
            color: #A280E9;
        }
        .icon-3 {
            color: #85ADE3;
        }
        .icon-4 {
            color: #E36AC8;
        }
        .icon-5 {
            color: #70D7A5;
        }
        .icon-6 {
            color: #5F5CE0;
        }
        .icon-7 {
            color: #E86786;
        }
        .icon-8 {
            color: #F1D243;
        }
        .icon-9 {
                color: #585858;
        }
        /* main--content */
        .main--content {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: calc(100% - 300px);
            padding: 14px 50px;
            overflow-y: auto;
            transition: .1s;
	    margin-top: 60px;
        }
        .main--content.active {
            width: calc(100% - 103px);
        }
        @media screen and (max-width:1024px) {
            table {
                min-width: 600px;
            }
        }
        @media screen and (max-width:768px) {
            .logo {
                padding-left: 30px;
                width: fit-content;
            }
            .search--notification--profile {
                padding: 0 20px;
                margin-left: auto;
            }
            .main--content {
                padding: 0 20px;
            }
            .sidebar {
                padding: 20px;
            }
            .sidebar.active {
                width: 85px;
            }
            .main--content.active {
                width: calc(100% - 85px);
            }
        }
        @media screen and (max-width:590px) {
            .lock,
            .chat {
                display: none;
            }
            .notification--profile {
                margin-left: auto;
            }
            .search--notification--profile {
                width: fit-content;
            }
            .sidebar {
                transform: translateX(-100%);
                z-index: 10;
                background-color: #fff;
            }
            .sidebar.active {
                transform: translateX(0);
                width: 300px;
            }
            .sidebar.active .sidebar--item {
                display: block;
            }
            .main--content {
                width: calc(100% - 0px);
            }
            .main--content.active {
                width: calc(100% - 0px);
            }
        }
        @media screen and (max-width:450px) {
            .main--content {
                padding: 0 10px;
            }
            .logo {
                padding-left: 10px;
            }
            .search--notification--profile {
                padding: 0 10px;
            }
            .sidebar {
                padding: 10px;
            }
        }
    </style>
    <!-- 절취선-->
    <style>

        .main-container{
              display: flex;
              width: 100%;
              height: 100%;
          }
          .contents{
              width: 100%;
              height: 100%;
              display: flex;
          }
          .img-notice{
              width: 40%;
              display: flex;
              height: 100%;
              flex-direction: column;
              left:50px;

          }
          .box-img{
              width: 95%;
              height: 83%;
              margin-bottom: 24px;
              border: 1px solid;
              border-radius: 24px;

            border: 0px solid rgba(0, 0, 0, 0.125);
            border-radius: 1rem;
            box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
            overflow-wrap: break-word;
            min-width: 0px;
            color: rgba(0, 0, 0, 0.87);
            transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            overflow: hidden;
          justify-content: center;
          }

          .box-notice{
              width: 100%;
              height: 100%;
              border: 1px solid;
              border-radius: 24px;
                 text-align: left;


           border: 0px solid rgba(0, 0, 0, 0.125);
            border-radius: 1rem;
            box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
            overflow-wrap: break-word;
            min-width: 0px;
            color: rgba(0, 0, 0, 0.87);
            transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            overflow: hidden;
          justify-content: center;
          }
          .title {
          color: white; /* 원하는 폰트 컬러 값으로 변경 */
          text-align: left; /* 왼쪽 정렬 스타일 적용 */
      }

.olcards * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.olcards {
  list-style: none;
  counter-reset: cardCount;
  font-family: sans-serif;
  display: flex;
  flex-direction: column;
  --cardsGap: 1rem;
  gap: var(--cardsGap);
  padding-bottom: var(--cardsGap);
  max-width: 100%;
   margin: 0 auto;
}
 .olcards li {
  counter-increment: cardCount;
    display: flex;
    color: white;
    --labelOffset: 1rem;
    --arrowClipSize: 1.5rem;
    margin-top: var(--labelOffset);
    height: 50px;
    width: 100%;
    flex-direction: row;
    justify-content: center;
}
 .olcards li::before {
  content: counter(cardCount, decimal-leading-zero);
  background: white;
  color: var(--cardColor);
  font-size: 2em;
  font-weight: 700;
  transform: translateY(calc(-1 * var(--labelOffset)));
  margin-right: calc(-1 * var(--labelOffset));
  z-index: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  padding-inline: 0.5em;
}
.olcards li .content {

  background-color: var(--cardColor);
  --inlinePadding: 9em;
  --boxPadding: 0.5em;
  display: grid;
  padding: var(--boxPadding) calc(var(--inlinePadding) + var(--arrowClipSize))
    var(--boxPadding) calc(var(--inlinePadding) + var(--labelOffset));
  grid-template-areas:
    "icon title"
    "icon text";
  gap: 0.25em 1em;
  clip-path: polygon(
    0 0,
    calc(100% - var(--arrowClipSize)) 0,
    100% 50%,
    calc(100% - var(--arrowClipSize)) 100%,
    calc(100% - var(--arrowClipSize)) calc(100% + var(--cardsGap)),
    0 calc(100% + var(--cardsGap))
  );
  position: relative;
}


.olcards li .content::before {
  content: "";
  position: absolute;
  width: var(--labelOffset);
  height: var(--labelOffset);
  background: var(--cardColor);
  left: 0;
  bottom: 0;
  clip-path: polygon(0 0, 100% 0, 0 100%);
  filter: brightness(0.75);
}
        .olcards li .content::after {
  content: "";
  position: absolute;
  height: var(--cardsGap);
  width: var(--cardsGap);
  background: linear-gradient(to right, rgba(0, 0, 0, 0.25), transparent 50%);
  left: 0;
  top: 100%;
}
        .olcards li .icon {
  grid-area: icon;
  align-self: center;
}
.olcards li .content .title {
  grid-area: title;
  font-size: 1.25em;
  font-weight: 600;

}
.olcards li .content .text {
  grid-area: text;

}


          .board-class{
              padding: 0px 19px;
              width: 32%;
              height: 100%;


          }


          .class-1{
              width: 100%;
              height: 23%;
              margin-bottom: 21px;
              border: 1px solid;
              border-radius: 24px;
              background-color : rgba(211, 248, 245, 1);



            border: 0px solid rgba(0, 0, 0, 0.125);
            border-radius: 1rem;
            box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
            overflow-wrap: break-word;
            min-width: 0px;
            color: rgba(0, 0, 0, 0.87);
            transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            overflow: hidden;
            justify-content: center;
          }

 .class-1 h2 {
       font-family: "Poppins", sans-serif;
        color: #4A148C;

    }


          .class-2{
              width: 100%;
              height: 23%;
              margin-bottom: 21px;
              border: 1px solid;
              border-radius: 24px;
              background-color : rgba(235, 233, 251, 1);

            border: 0px solid rgba(0, 0, 0, 0.125);
            border-radius: 1rem;
            box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
            overflow-wrap: break-word;
            min-width: 0px;
            color: rgba(0, 0, 0, 0.87);
            transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            overflow: hidden;
            justify-content: center;
          }

          .class-2 h2 {
       font-family: "Poppins", sans-serif;
        color: #EC407A;

    }

         .class-3{
              width: 100%;
              height: 23%;
              margin-bottom: 21px;
              border: 1px solid;
              border-radius: 24px;
              background-color : rgba(233, 251, 233, 1);

            border: 0px solid rgba(0, 0, 0, 0.125);
            border-radius: 1rem;
            box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
            overflow-wrap: break-word;
            min-width: 0px;
            color: rgba(0, 0, 0, 0.87);
            transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            overflow: hidden;
            justify-content: center;
          }

          .class-3 h2 {
       font-family: "Poppins", sans-serif;
        color: #64B5F6;

    }

         .class-4{
              width: 100%;
              height: 23%;
              margin-bottom: 21px;
              border: 1px solid;
              border-radius: 24px;
              background-color : rgba(243, 249, 216, 1);

            border: 0px solid rgba(0, 0, 0, 0.125);
            border-radius: 1rem;
            box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
            overflow-wrap: break-word;
            min-width: 0px;
            color: rgba(0, 0, 0, 0.87);
            transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            overflow: hidden;
            justify-content: center;
          }

          .class-4 h2 {
       font-family: "Poppins", sans-serif;
color: #4A148C;

    }

          .plan-game{
              width: 28%;
              height: 100%;
          }

          .plan-container{
              width: 100%;
              height: 50%;
              border: 1px solid;
              border-radius: 24px;
              margin-bottom: 10px;

    border: 0px solid rgba(0, 0, 0, 0.125);
    border-radius: 1rem;
    box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
    overflow-wrap: break-word;
    min-width: 0px; /* 최대 너비 제한 */
    color: rgba(0, 0, 0, 0.87);
    transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    overflow: hidden;

    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;

    background-color: rgb(255, 255, 255);
    background-clip: border-box;
    justify-content: flex-start;
          }

          .fc .fc-toolbar.fc-header-toolbar {
          margin-top: 10px;
          margin-bottom: 10px;
          margin-right: 10px;
          margin-left: 10px;
          }
          .fc .fc-toolbar {
          display: flex;
              justify-content: space-between;
              align-items: center;
              font-size: 12px;
          }


          .game-container{
              width: 100%;
              height: 48%;
              border: 1px solid;
          }


    /* body 스타일 */
    .calendar {
      overflow: hidden;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 3px;
       height: 50%;
    }
    /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
    .fc-header-toolbar {
      padding-top: 1em;
      padding-left: 1em;
      padding-right: 1em;

    }

        #calendar {
            margin: 0 auto;
          }
      .fc .fc-toolbar.fc-header-toolbar {
          margin-top: 10px;
          margin-bottom: 10px;
          margin-right: 10px;
          margin-left: 10px;
          }
          .fc .fc-toolbar {
          display: flex;
              justify-content: space-between;
              align-items: center;
              font-size: 12px;
          }

    .fc .fc-button {

      line-height: 0.5;

  }
        .img-slider{
  position: relative;
  width: 100%;
  height: 100%;
  background: #5679d026;
}

.img-slider .slide {
  z-index: 1;
  position: absolute;
  width: 100%;
  transform: translateX(100%);
}

.img-slider .slide.active {
  width: 100%;
  height: 100%;
  transform: translateX(0);
  transition: 2s;
  transition-property: transform;
}

.img-slider .slide img{
  z-index: 1;
  width: 100%;
  border-radius: 5px;
}

.img-slider .slide .info{
  position: absolute;
  top: 0;
  padding: 15px 30px;
}

.img-slider .slide{
  color: #fff;
  font-size: 45px;
  text-transform: uppercase;
  font-weight: 800;
  letter-spacing: 2px;
}

.img-slider .slide{
  color: #fff;
  background: rgba(0, 0, 0, 0.1);
  font-size: 16px;
  border-radius: 4px;
}

.img-slider .navigation{
  z-index: 2;
  position: absolute;
  display: flex;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
}

.img-slider .navigation .btn{
  background: rgba(255, 255, 255, 0.5);
  width: 12px;
  height: 12px;
  margin: 10px;
  border-radius: 50%;
  cursor: pointer;
}

.img-slider .navigation .btn.active{
  background: #2696E9;
  box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
}

@media (max-width: 820px){
  .img-slider{
    width: 600px;
    height: 375px;
  }

  .img-slider .slide .info{
    padding: 10px 25px;
  }

  .img-slider .slide{
    font-size: 35px;
  }

  .img-slider .slide{
    width: 70%;
    font-size: 15px;
  }

  .img-slider .navigation{
    bottom: 25px;
  }

  .img-slider .navigation .btn{
    width: 10px;
    height: 10px;
    margin: 8px;
  }
}

@media (max-width: 620px){
  .img-slider{
    width: 400px;
    height: 250px;
  }

  .img-slider .slide .info{
    padding: 10px 20px;
  }

  .img-slider .slide{
    font-size: 30px;
  }

  .img-slider .slide{
    width: 80%;
    font-size: 13px;
  }

  .img-slider .navigation{
    bottom: 15px;
  }

  .img-slider .navigation .btn{
    width: 8px;
    height: 8px;
    margin: 6px;
  }
}

@media (max-width: 420px){
  .img-slider{
    width: 320px;
    height: 200px;
  }

  .img-slider .slide .info{
    padding: 5px 10px;
  }

  .img-slider .slide{
    font-size: 25px;
  }

  .img-slider .slide{
    width: 90%;
    font-size: 11px;
  }

  .img-slider .navigation{
    bottom: 10px;
  }
    </style>

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


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const slides = document.querySelectorAll('.slide');
            const btns = document.querySelectorAll('.btn');
            let currentSlide = 0;

            function manualNav(manual) {
                slides.forEach((slide) => {
                    slide.classList.remove('active');
                });

                btns.forEach((btn) => {
                    btn.classList.remove('active');
                });

                slides[manual].classList.add('active');
                btns[manual].classList.add('active');
            }

            btns.forEach((btn, i) => {
                btn.addEventListener("click", () => {
                    manualNav(i);
                    currentSlide = i;
                });
            });

            function repeat(activeClass) {
                const active = document.getElementsByClassName('active');
                let i = 0;

                function repeater() {
                    setTimeout(function() {
                        [...active].forEach((activeSlide) => {
                            activeSlide.classList.remove('active');
                        });

                        slides[i].classList.add('active');
                        btns[i].classList.add('active');
                        i++;

                        if (slides.length == i) {
                            i = 0;
                        }
                        if (i >= slides.length) {
                            return;
                        }
                        repeater();
                    }, 3000);
                }
                repeater();
            }

            repeat();
            /* No JavaScript :p */const playBoard = document.querySelector(".play-board");
const scoreElement = document.querySelector(".score");
const highScoreElement = document.querySelector(".high-score");
const controls = document.querySelectorAll(".controls i");
let gameOver = false;
let foodX, foodY;
let snakeX = 5, snakeY = 5;
let velocityX = 0, velocityY = 0;
let snakeBody = [];
let setIntervalId;
let score = 0;
// Getting high score from the local storage
let highScore = localStorage.getItem("high-score") || 0;
highScoreElement.innerText = `High Score: ${highScore}`;
const updateFoodPosition = () => {
    // Passing a random 1 - 30 value as food position
    foodX = Math.floor(Math.random() * 30) + 1;
    foodY = Math.floor(Math.random() * 30) + 1;
}
const handleGameOver = () => {
    // Clearing the timer and reloading the page on game over
    clearInterval(setIntervalId);
    alert("Game Over! Press OK to replay...");
    location.reload();
}
const changeDirection = e => {
    // Changing velocity value based on key press
    if(e.key === "ArrowUp" && velocityY != 1) {
        velocityX = 0;
        velocityY = -1;
    } else if(e.key === "ArrowDown" && velocityY != -1) {
        velocityX = 0;
        velocityY = 1;
    } else if(e.key === "ArrowLeft" && velocityX != 1) {
        velocityX = -1;
        velocityY = 0;
    } else if(e.key === "ArrowRight" && velocityX != -1) {
        velocityX = 1;
        velocityY = 0;
    }
}
// Calling changeDirection on each key click and passing key dataset value as an object
controls.forEach(button => button.addEventListener("click", () => changeDirection({ key: button.dataset.key })));
const initGame = () => {
    if(gameOver) return handleGameOver();
    let html = `<div class="food" style="grid-area: ${foodY} / ${foodX}"></div>`;
    // Checking if the snake hit the food
    if(snakeX === foodX && snakeY === foodY) {
        updateFoodPosition();
        snakeBody.push([foodY, foodX]); // Pushing food position to snake body array
        score++; // increment score by 1
        highScore = score >= highScore ? score : highScore;
        localStorage.setItem("high-score", highScore);
        scoreElement.innerText = `Score: ${score}`;
        highScoreElement.innerText = `High Score: ${highScore}`;
    }
    // Updating the snake's head position based on the current velocity
    snakeX += velocityX;
    snakeY += velocityY;

    // Shifting forward the values of the elements in the snake body by one
    for (let i = snakeBody.length - 1; i > 0; i--) {
        snakeBody[i] = snakeBody[i - 1];
    }
    snakeBody[0] = [snakeX, snakeY]; // Setting first element of snake body to current snake position
    // Checking if the snake's head is out of wall, if so setting gameOver to true
    if(snakeX <= 0 || snakeX > 30 || snakeY <= 0 || snakeY > 30) {
        return gameOver = true;
    }
    for (let i = 0; i < snakeBody.length; i++) {
        // Adding a div for each part of the snake's body
        html += `<div class="head" style="grid-area: ${snakeBody[i][1]} / ${snakeBody[i][0]}"></div>`;
        // Checking if the snake head hit the body, if so set gameOver to true
        if (i !== 0 && snakeBody[0][1] === snakeBody[i][1] && snakeBody[0][0] === snakeBody[i][0]) {
            gameOver = true;
        }
    }
    playBoard.innerHTML = html;
}
updateFoodPosition();
setIntervalId = setInterval(initGame, 100);
document.addEventListener("keyup", changeDirection);
        });
    </script>

<style>
    /* Import Google font */

.wrapper {
  width: 33vmin;
  height: 44vmin;
  display: flex;
  overflow: hidden;
  flex-direction: column;
  justify-content: center;
  border-radius: 5px;
  background: #293447;
  box-shadow: 0 20px 40px rgba(52, 87, 220, 0.2);
}
.game-details {
  color: #B8C6DC;
  font-weight: 500;
  font-size: 1.2rem;
  padding: 20px 27px;
  display: flex;
  justify-content: space-between;
}
.play-board {
  height: 100%;
  width: 100%;
  display: grid;
  background: #212837;
  grid-template: repeat(30, 1fr) / repeat(30, 1fr);
}
.play-board .food {
  background: #FF003D;
}
.play-board .head {
  background: #60CBFF;
}

.controls {
  display: none;
  justify-content: space-between;
}
.controls i {
  padding: 25px 0;
  text-align: center;
  font-size: 1.3rem;
  color: #B8C6DC;
  width: calc(100% / 4);
  cursor: pointer;
  border-right: 1px solid #171B26;
}

@media screen and (max-width: 800px) {
  .wrapper {
    width: 90vmin;
    height: 115vmin;
  }
  .game-details {
    font-size: 1rem;
    padding: 15px 27px;
  }
  .controls {
    display: flex;
  }
  .controls i {
    padding: 15px 0;
    font-size: 1rem;
  }
}
</style>

</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans:👖:</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로 <span style="color:#5073FB">지</span>금!</h5>
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
                <span>???님 오늘도 파이팅하세요:😊:</span>
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
            <div class="contents">
                <div class="img-notice">
                    <div class="box-img">
                        <a>
                            <div class="img-slider">
                                <div class="slide active">
                                    <img src="https://gogumafarm.kr/wp-content/uploads/2023/06/%EC%B9%B4%ED%88%B0%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%ED%8C%8C%EC%9B%8C%ED%8D%BC%ED%94%84%EA%B1%B8-700x392.png" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="https://isplus.com/data/isp/image/2023/07/18/isp20230718000308.600x.0.jpg" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="http://dh.aks.ac.kr/Edu/wiki/images/a/a5/%EA%B7%80%EC%97%AC%EC%9B%A1.gif" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="../../../resources/image/main/cat.png" alt="today">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="https://gogumafarm.kr/wp-content/uploads/2023/06/%EC%9C%A0%ED%8A%9C%EB%B8%8C-%EB%89%B4%EC%A7%84%EC%8A%A4-%ED%8C%8C%EC%9B%8C%ED%8D%BC%ED%94%84%EA%B1%B8-700x394.png" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="navigation">
                                    <div class="btn active"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="box-notice">
                        <ul>
                            <ol class="olcards">
                                    <li style="--cardColor:#7E57C2">
                                        <a href="/notice/list">
                                            <div class="content">
                                                <div class="icon">🌏</div>
                                                <div class="title"><span>${noticeMap.notice1.title}</span></div>
                                            </div>
                                        </a>
                                    </li>



                                <li style="--cardColor: #1A237E">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <div class="icon">🚀</div>
                                            <div class="title">공지리스트2</div>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #3F51B5 ">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <div class="icon">🍧</div>
                                            <div class="title">공지리스트3</div>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #1976D2">
                                    <a href="/notice">
                                        <div class="content">
                                            <div class="icon">🛸</div>
                                            <div class="title">공지리스트4</div>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor:	#00ACC1">
                                    <a href="/notice">
                                        <div class="content">
                                            <div class="icon">🐧</div>
                                            <div class="title">공지리스트5</div>
                                        </div>
                                    </a>
                                </li>

                            </ol>
                        </ul>
                    </div>
                </div>

                <div class="board-class">
                    <div class="class-1">
                        <a href="/board1/list">
                        <h1>1반</h1>
                        </a>
                    </div>
                    <div class="notice-list">
                        <h3>게시글</h3>
                        <ul>
                            <li><a href=""></a></li>

                        </ul>
                    </div>

                    <div class="class-2">
                        <a href="/board2/list">
                        <h1>2반</h1>
                        </a>
                    </div>
                    <div class="notice-list">
                        <h3>게시글</h3>
                        <ul>
                            <li><a href=""></a></li>
                        </ul>
                    </div>

                    <div class="class-3">
                        <a href="/board3/list">
                        <h1>3반</h1>
                        </a>
                    </div>
                    <div class="notice-list">
                        <h3>게시글</h3>
                        <ul>

                            <li><a href=""></a></li>

                        </ul>
                    </div>

                    <div class="class-4">
                        <a href="/board4/list">
                        <h1>4반</h1>
                        </a>
                    </div>
                </div>
                <div class="notice-list">
                    <h3>게시글</h3>
                    <ul>

                        <li><a href=""></a></li>

                    </ul>
                </div>

                <div class="plan-game">
                    <div class="plan-container">

                        <!-- calendar 태그 -->
                        <div id='calendar-container'>
                            <div id='calendar'></div>
                        </div>
                    </div>
                    <div class="game-container">
                        <div class="wrapper">
                            <div class="game-details">
                                <span class="score">Score: 0</span>
                                <span class="high-score">High Score: 0</span>
                            </div>
                            <div class="play-board"></div>
                            <div class="controls">
                                <i data-key="ArrowLeft" class="fa-solid fa-arrow-left-long"></i>
                                <i data-key="ArrowUp" class="fa-solid fa-arrow-up-long"></i>
                                <i data-key="ArrowRight" class="fa-solid fa-arrow-right-long"></i>
                                <i data-key="ArrowDown" class="fa-solid fa-arrow-down-long"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
