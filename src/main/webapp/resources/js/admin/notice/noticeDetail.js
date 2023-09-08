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

   //댓글 입력
   $(".insert-reply").click(function() {
       // reply-insert 클래스를 가진 입력 필드의 값을 가져옵니다.
       const replyContent = $(".reply-insert").val();

       // 값이 비어 있지 않은 경우에만 실행합니다.
       if (replyContent.trim() !== "") {
           const memberId = $(".param-member_id").val();
           const noticeNo = $(".param-notice_no").val();
            console.log(memberId);
            console.log(noticeNo);
           // 서버로 데이터를 전송합니다.
           $.ajax({
               url: '/nReply_insert',
               type: 'POST',
               data: {
                   'notice_no': noticeNo,
                   'content': replyContent
               },
               success: function(response) {
                   if (response === 'success') {
                       // 성공적으로 댓글이 등록된 경우
                       console.log("댓글 등록 성공");
                   } else {
                       // 댓글 등록 실패
                       console.log("댓글 등록 실패");
                   }
               }
           });
       } else {
           // reply-insert 값이 비어 있는 경우
           alert("댓글 내용을 입력해주세요.");
       }
   });
});
$(document).ready(function() {
  $("#confirmDelete").click(function() {
    var noticeNo = $(".param-notice_no").val();
    console.log(noticeNo);
    $.ajax({
      url: "/isShowNotice",
      type: "POST",
      data: { notice_no: noticeNo },
      success: function(response) {
        if(response==="success"){
            console.log("공지사항 게시글 삭제 성공");
            window.location.href="/noticeList";
        }else{
            console.log("공지사항 게시글 삭제 실패");
        }
      },
      error: function(xhr, status, error) {
        console.log("공지사항 게시글 삭제 중 에러발생");
      }
    });
  });
});
