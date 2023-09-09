$(document).ready(function() {
    //게시글 모달
       $(document).on('click', '.delete', function() {
           // Modal 보이기
           $('#myModal').css('visibility', 'visible');
         });

         // 확인 버튼 클릭 시 이벤트 핸들러 (삭제 작업 처리)
         $(document).on('click', '#confirmDelete', function() {
           // TODO: 실제로 삭제 작업을 수행하는 코드를 여기에 추가

           // Modal 숨기기
           $('#myModal').css('visibility', 'hidden');
         });

         // 취소 버튼 클릭 시 이벤트 핸들러 (모달 닫기)
         $(document).on('click', '#cancelDelete', function() {
           // Modal 숨기기
           $('#myModal').css('visibility', 'hidden');
         });
     //댓글 모달
     $(document).on('click', '.reply-delete', function() {
            // Modal 보이기
            $('#replyDeleteModal').css('visibility', 'visible');
          });

          // 확인 버튼 클릭 시 이벤트 핸들러 (삭제 작업 처리)
          $(document).on('click', '#replyConfirmDelete', function() {
            // TODO: 실제로 삭제 작업을 수행하는 코드를 여기에 추가

            // Modal 숨기기
            $('#replyDeleteModal').css('visibility', 'hidden');
          });

          // 취소 버튼 클릭 시 이벤트 핸들러 (모달 닫기)
          $(document).on('click', '#replyCancelDelete', function() {
            // Modal 숨기기
            $('#replyDeleteModal').css('visibility', 'hidden');
          });

   //댓글 입력
   $("#insert-reply").click(function() {
       // reply-insert 클래스를 가진 입력 필드의 값을 가져옵니다.
       const replyContent = $(".reply-insert").val();
       const notice_no = $(".param-notice_no").val();
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
                       window.location.href="/noticeDetail/"+notice_no;
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
  //공지사항 isShow 'N'처리
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
  //댓글 isShow 'N'처리
  $("#replyConfirmDelete").click(function() {
      var replyNo = $(this).parent().data("reply-no");
      const notice_no = $(".param-notice_no").val();
        console.log(replyNo);
      $.ajax({
        url: "/isShowNreply",
        type: "POST",
        data: { comment_no: replyNo },
        success: function(response) {
          if(response==="success"){
              console.log("댓글 삭제 성공");
              window.location.href="/noticeDetail/"+notice_no;
          }else{
              console.log("댓글 삭제 실패");
          }
        },
        error: function(xhr, status, error) {
          console.log("댓글 삭제 중 에러발생");
        }
      });
    });
    $(".reply-edit").click(function() {
      // 댓글 내용 가져오기
      var replyContent = $(this).closest('.reply-info').find('.reply-content').data("reply-content");

      // 댓글 내용을 textarea로 이동
      $(".reply-insert").val(replyContent);

      // textarea에 포커스 설정
      $(".reply-insert").focus();
    });
    //댓글 수정
      $("#update-reply").click(function() {
          const replyNo = $(".reply-insert").val();
          const notice_no = $(".param-notice_no").val();
            console.log(replyNo);
        });
});
