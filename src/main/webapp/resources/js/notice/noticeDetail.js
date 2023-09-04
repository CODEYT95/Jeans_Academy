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

  let menu = $('.menu');
  let sidebar = $('.sidebar');
  let mainContent = $('.main--content');

  menu.click(function() {
    sidebar.toggleClass('active');
    mainContent.toggleClass('active');
  });
});
//각 반별로 게시판 권한 주기
$(document).ready(function() {
       var member_class = document.body.getAttribute('data-member-class');
       console.log(member_class);
       // 클릭 이벤트 캔슬 함수
       function cancelClickEvent(links) {
           links.forEach(function(link) {
               link.addEventListener("click", function(event) {
                   event.preventDefault(); // 클릭 이벤트를 캔슬합니다.
               });
           });
       }

       var sideClass1 = document.querySelectorAll(".sideBoard1")
       var sideClass2 = document.querySelectorAll(".sideBoard2")
       var sideClass3 = document.querySelectorAll(".sideBoard3")
       var sideClass4 = document.querySelectorAll(".sideBoard4")


       if (member_class === "1반") {

           cancelClickEvent(sideClass2);
           cancelClickEvent(sideClass3);
           cancelClickEvent(sideClass4);
       } else if (member_class === "2반") {

           cancelClickEvent(sideClass1);
           cancelClickEvent(sideClass3);
           cancelClickEvent(sideClass4);
      } else if (member_class === "3반") {

           cancelClickEvent(sideClass1);
           cancelClickEvent(sideClass2);
           cancelClickEvent(sideClass4);
       } else if (member_class === "4반") {

           cancelClickEvent(sideClass1);
           cancelClickEvent(sideClass2);
           cancelClickEvent(sideClass3);
       }
   });