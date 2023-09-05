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
         // Modal 숨기기
         $('#myModal').css('display', 'none');
   });

   // 취소 버튼 클릭 시 이벤트 핸들러 (모달 닫기)
   $('#cancelDelete').click(function() {
     // Modal 숨기기
     $('#myModal').css('display', 'none');
   });


});
