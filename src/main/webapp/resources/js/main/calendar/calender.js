
function drawCalendar(year, month) {
  // 여기에 달력을 그리는 코드를 작성하세요.
  // 주어진 year와 month에 해당하는 달력을 생성하고 HTML에 삽입하는 등의 작업을 수행합니다.
}

// 페이지 로드 시 현재 날짜의 달력을 그리도록 설정
document.addEventListener("DOMContentLoaded", function () {
  const now = new Date();
  const year = now.getFullYear();
  const month = now.getMonth() + 1;
  drawCalendar(year, month);
});