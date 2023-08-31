$(document).ready(function() {


   // Delete 버튼 클릭 시 이벤트 핸들러
   $('.delete').click(function() {
     // Modal 보이기
     $('#myModal').css('display', 'block');
   });

   // 닫기 버튼 클릭 시 이벤트 핸들러
   $('.close').click(function() {
     // Modal 숨기기
     $('#myModal').css('display', 'none');
   });

   // 확인 버튼 클릭 시 이벤트 핸들러 (삭제 작업 처리)
   $('#confirmDelete').click(function() {
     // TODO: 실제로 삭제 작업을 수행하는 코드를 여기에 추가

     // 예시로 경고창으로 확인 메시지 표시 후, 모달 숨기기
     if (confirm("정말로 삭제하시겠습니까?")) {
         console.log("삭제가 완료되었습니다."); // 예시로 콘솔에 메시지 출력

         // Modal 숨기기
         $('#myModal').css('display', 'none');
     }
   });

   // 취소 버튼 클릭 시 이벤트 핸들러 (모달 닫기)
   $('#cancelDelete').click(function() {
     // Modal 숨기기
     $('#myModal').css('display', 'none');
   });

  let menu = $('.menu');
  let sidebar = $('.sidebar');
  let mainContent = $('.main--content');

  menu.click(function() {
    sidebar.toggleClass('active');
    mainContent.toggleClass('active');
  });
});

