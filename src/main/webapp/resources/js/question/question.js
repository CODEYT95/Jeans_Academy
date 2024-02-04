$(document).ready(function() {
  // 페이지가 로드되면 모든 댓글의 시간을 업데이트합니다.
  updateAllReplyTimes();

  // 새 댓글이 추가되거나 삭제될 때마다 시간을 업데이트하려면
  // 해당 이벤트 핸들러에도 updateAllReplyTimes()를 호출하면 됩니다.
});

function updateAllReplyTimes() {
  $('.postdate').each(function() {
    const regdateString = $(this).text(); // '2023-09-12 21:02:38.0'
    const regdate = new Date(regdateString);
    const regdateUTC = new Date(regdate.toUTCString()); // UTC로 변환

    const currentTime = new Date();
    const currentTimeUTC = new Date(currentTime.toUTCString()); // UTC로 변환

    const formattedTime = timeAgo(regdateUTC, currentTimeUTC);
    $(this).text(formattedTime);
  });
}

function timeAgo(time, currentTime) {
  const timeDifference = currentTime - time;
  const seconds = Math.floor(timeDifference / 1000);
  const minutes = Math.floor(seconds / 60);
  const hours = Math.floor(minutes / 60);
  const days = Math.floor(hours / 24);

  if (seconds < 60) {
    return "방금 전";
  } else if (minutes < 60) {
    return `${minutes}분 전`;
  } else if (hours < 24) {
    return `${hours}시간 전`;
  } else {
    return `${days}일 전`;
  }
}

  // 여기 아래에 검색 기능 코드 추가
  $(document).ready(function () {
      let originalBoxes = $('.box-list .box').clone(); // 처음 로드된 박스들을 복사하여 저장

      $('.search-button').click(function () {
          performSearch();
      });

      $('.search-input').keyup(function (event) {
          if (event.keyCode === 13) { // Enter 키를 눌렀을 때
              performSearch();
          }
      });

      // 박스 클릭 이벤트 리스너 추가
      $('.box-list .box').click(function () {
          let boxTitle = $(this).find('div').text();
          let boxContent = $(this).find('p').text();
          let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
          window.location.href = detailURL;
      });

      function performSearch() {
          let searchKeyword = $('.search-input').val().toLowerCase();
          let matchingBoxes = [];

          originalBoxes.each(function () {
              let boxTitle = $(this).find('div').text().toLowerCase();
              if (boxTitle.includes(searchKeyword)) {
                  matchingBoxes.push($(this));
              }
          });

          $('.box-list').empty(); // 이전 검색 결과를 제거

          matchingBoxes.forEach(function (box) {
              $('.box-list').append(box);
          });

          // 필터링된 결과에 대한 박스 클릭 이벤트 리스너 추가
          $('.box-list .box').click(function () {
              let boxTitle = $(this).find('div').text();
              let boxContent = $(this).find('p').text();
              let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
              window.location.href = detailURL;
          });

          document.getElementById("write-button").addEventListener("click", function () {
              // 글작성 페이지의 URL로 이동
              window.location.href = "/question/write";
          });
      }
  });
  $(document).ready(function () {
      // 사용자의 스크롤 위치에 따라 버튼을 표시하거나 숨깁니다.
      $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
              $('.scroll-to-top').fadeIn();
          } else {
              $('.scroll-to-top').fadeOut();
          }
      });

      // 버튼을 클릭하면 맨 위로 스크롤합니다.
      $('#scroll-to-top-button').click(function () {
          $('html, body').animate({ scrollTop: 0 }, 'slow');
          return false;
      });
  });






// 마우스
// <![CDATA[
var sparks=75; // how many sparks per clicksplosion
var speed=33; // how fast - smaller is faster
var bangs=5; // how many can be launched simultaneously (note that using too many can slow the script down)
var colours=new Array('#03f', '#f03', '#0e0', '#93f', '#0cf', '#f93', '#f0c');
//                     blue    red     green   purple  cyan    orange  pink

/****************************
*   Clicksplosion Effect    *
*(c)2012-3 mf2fm web-design *
*  http://www.mf2fm.com/rv  *
* DON'T EDIT BELOW THIS BOX *
****************************/
var intensity=new Array();
var Xpos=new Array();
var Ypos=new Array();
var dX=new Array();
var dY=new Array();
var stars=new Array();
var decay=new Array();
var timers=new Array();
var swide=800;
var shigh=600;
var sleft=sdown=0;
var count=0;

function addLoadEvent(funky) {
  var oldonload=window.onload;
  if (typeof(oldonload)!='function') window.onload=funky;
  else window.onload=function() {
    if (oldonload) oldonload();
    funky();
  }
}

addLoadEvent(clicksplode);

function clicksplode() { if (document.getElementById) {
  var i, j;
  window.onscroll=set_scroll;
  window.onresize=set_width;
  document.onclick=eksplode;
  set_width();
  set_scroll();
  for (i=0; i<bangs; i++) for (j=sparks*i; j<sparks+sparks*i; j++) {
    stars[j]=createDiv('*', 13);
    document.body.appendChild(stars[j]);
  }
}}

function createDiv(char, size) {
  var div, sty;
  div=document.createElement('div');
  sty=div.style;
  sty.font=size+'px monospace';
  sty.position='absolute';
  sty.backgroundColor='transparent';
  sty.visibility='hidden';
  sty.zIndex='101';
  div.appendChild(document.createTextNode(char));
  return (div);
}

function bang(N) {
  var i, Z, A=0;
  for (i=sparks*N; i<sparks*(N+1); i++) {
    if (decay[i]) {
      Z=stars[i].style;
      Xpos[i]+=dX[i];
      Ypos[i]+=(dY[i]+=1.25/intensity[N]);
      if (Xpos[i]>=swide || Xpos[i]<0 || Ypos[i]>=shigh+sdown || Ypos[i]<0) decay[i]=1;
	  else {
        Z.left=Xpos[i]+'px';
        Z.top=Ypos[i]+'px';
	  }
      if (decay[i]==15) Z.fontSize='7px';
      else if (decay[i]==7) Z.fontSize='2px';
      else if (decay[i]==1) Z.visibility='hidden';
	  decay[i]--;
	}
	else A++;
  }
  if (A!=sparks) timers[N]=setTimeout('bang('+N+')', speed);
}

function eksplode(e) {
  var x, y, i, M, Z, N;
  set_scroll();
  y=(e)?e.pageY:event.y+sdown;
  x=(e)?e.pageX:event.x+sleft;
  N=++count%bangs;
  M=Math.floor(Math.random()*3*colours.length);
  intensity[N]=5+Math.random()*4;
  for (i=N*sparks; i<(N+1)*sparks; i++) {
    Xpos[i]=x;
    Ypos[i]=y-5;
    dY[i]=(Math.random()-0.5)*intensity[N];
    dX[i]=(Math.random()-0.5)*(intensity[N]-Math.abs(dY[i]))*1.25;
    decay[i]=16+Math.floor(Math.random()*16);
    Z=stars[i].style;
    if (M<colours.length) Z.color=colours[i%2?count%colours.length:M];
    else if (M<2*colours.length) Z.color=colours[count%colours.length];
    else Z.color=colours[i%colours.length];
    Z.fontSize='13px';
    Z.visibility='visible';
  }
  clearTimeout(timers[N]);
  bang(N);
}

function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min-7;
  shigh=sh_min-7;
}

function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}
// ]]>



