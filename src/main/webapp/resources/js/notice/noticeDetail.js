$(document).ready(function() {
   // Delete 버튼 클릭 시 이벤트 핸들러
   $('.delete').click(function(e) {
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
       // 확인 버튼 클릭 시 수행할 작업


           // AJAX 요청 보내기
           $.ajax({
               type: "POST", // POST 방식 요청
               url: "/noticeIsshow", // 요청할 URL
               data: { /* 데이터를 여기에 추가 */ },
               success: function(response) {
               if(response === 1){
                  // 요청이 성공했을 때 실행할 코드
                  console.log("삭제 요청이 성공했습니다.");
               }

                   // 모달 숨기기
                   $('#myModal').css('display', 'none');
               },
               error: function(error) {
                   // 요청이 실패했을 때 실행할 코드
                   console.error("삭제 요청이 실패했습니다.");
                   // 모달 숨기기
                   $('#myModal').css('display', 'none');
               }
           });

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

