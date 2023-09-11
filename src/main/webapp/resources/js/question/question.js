$(document).ready(function() {
  // 페이지가 로드되면 모든 댓글의 시간을 업데이트합니다.
  updateAllReplyTimes();

  // 새 댓글이 추가되거나 삭제될 때마다 시간을 업데이트하려면
  // 해당 이벤트 핸들러에도 updateAllReplyTimes()를 호출하면 됩니다.
});

function updateAllReplyTimes() {
  $('.postdate').each(function() {
    const regdate = $(this).text(); // 수정: 현재 요소의 텍스트 값을 가져옵니다.
    const formattedTime = timeAgo(new Date(regdate));
    $(this).text(formattedTime);
  });
}

function timeAgo(time) {
  const currentTime = new Date();
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
