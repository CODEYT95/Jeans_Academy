document.addEventListener("DOMContentLoaded", function () {
  function updateRelativeTime() {
      const currentTimestampMillis = Date.now();

      // 모든 .postdate 엘리먼트에 대해 반복
      $('.postdate').each(function () {
          var dateString = $(this).text(); // .postdate 엘리먼트의 텍스트 가져오기
          var isoTimestamp = new Date(dateString); // ISO 형식의 문자열을 날짜 객체로 변환

          var diff = currentTimestampMillis - isoTimestamp.getTime(); // 현재 시간과 타임스탬프의 차이 계산
          console.log('Diff (ms):', diff);

          // 상대 시간으로 업데이트
          $(this).text(relativeTime);
      });
  }
});
  $(document).ready(function () {
      // 초기화: 상대 시간 업데이트 함수 실행
      updateRelativeTime();

      // 1분마다 상대 시간 업데이트 함수 실행
      setInterval(updateRelativeTime, 60000);
  });

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
