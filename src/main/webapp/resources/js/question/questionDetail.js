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

   //QnA 댓글 입력
   $("#insert-reply").click(function() {
       // reply-insert 클래스를 가진 입력 필드의 값을 가져옵니다.
       const replyContent = $(".reply-insert").val();
       const question_no = $(".param-question_no").val();
       // 값이 비어 있지 않은 경우에만 실행합니다.
       if (replyContent.trim() !== "") {
           const memberId = $(".param-member_id").val();
           const question_no = $(".param-question_no").val();
            console.log(memberId);
            console.log(question_no);
           // 서버로 데이터를 전송합니다.
           $.ajax({
               url: '/question/qReply_insert',
               type: 'POST',
               data: {
                   'question_no': question_no,
                   'content': replyContent
               },
               success: function(response) {
                   if (response === 'success') {
                       // 성공적으로 댓글이 등록된 경우
                       console.log("댓글 등록 성공");
                       window.location.href=question_no;
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
  //QnA 게시글 isShow 'N'처리
  $("#confirmDelete").click(function() {
    var questionNo = $(".param-question_no").val();
    $.ajax({
      url: "/question/isShowQuestion",
      type: "POST",
      data: { question_no: questionNo },
      success: function(response) {
        if(response==="success"){
            console.log("공지사항 게시글 삭제 성공");
            window.location.href="/question/list";
        }else{
            console.log("공지사항 게시글 삭제 실패");
        }
      },
      error: function(xhr, status, error) {
        console.log("공지사항 게시글 삭제 중 에러발생");
      }
    });
  });
  //QnA 댓글 isShow 'N'처리
    $("#replyConfirmDelete").click(function() {
      const comment_no = $(".reply-list").find('.reply-info').data("reply-no");
      const question_no = $(".param-question_no").val();
      $.ajax({
        url: "/question/isShowQreply",
        type: "POST",
        data: { comment_no: comment_no },
        success: function(response) {
          if(response==="success"){
              console.log("댓글 삭제 성공");
              window.location.href=question_no;
          }else{
              console.log("댓글 삭제 실패");
          }
        },
        error: function(xhr, status, error) {
          console.log("댓글 삭제 중 에러발생");
        }
      });
    });
    // QnA 수정
    $(".edit").click(function() {
      const question_no = $(".param-question_no").val();
      window.location.href = "/question/update/"+question_no;
    });
    //QnA 댓글 수정
    $(".reply-edit").click(function() {
      // 댓글 내용 가져오기
      const replyContent = $(this).closest('.reply-info').find('.reply-content').data("reply-content");
      const replyNo = $(this).closest('.reply-info').data("reply-no");
      const question_no = $(".param-question_no").val();
      $('#insert-reply').css('display', 'none');
      $('#update-reply-cancle').css('display', 'block');
      $('#update-reply').css('display', 'block');
      // 댓글 내용을 textarea로 이동
      $(".reply-insert").val(replyContent);

      // textarea에 포커스 설정
      $(".reply-insert").focus();
      //QnA 댓글 수정
      $("#update-reply").click(function() {
        const replyUpdateContent = $(".reply-insert").val();
        $.ajax({
            url: "/question/qreplyUpdate",
            type: "POST",
            data: { comment_no: replyNo, comment_content: replyUpdateContent },
            success: function(response) {
              if(response==="success"){
                  console.log("댓글 수정 성공");
                  window.location.href=question_no;
              }else{
                  console.log("댓글 수정 실패");
              }
            },
            error: function(xhr, status, error) {
              console.log("댓글 수정 중 에러발생");
            }
        });
      });
    });
    $("#update-reply-cancle").click(function() {
        $('#insert-reply').css('display', 'block');
        $('#update-reply-cancle').css('display', 'none');
        $('#update-reply').css('display', 'none');
        $(".reply-insert").val("");
    });
});


$(document).ready(function() {
  // 페이지가 로드되면 모든 댓글의 시간을 업데이트합니다.
  updateAllReplyTimes();

  // 새 댓글이 추가되거나 삭제될 때마다 시간을 업데이트하려면
  // 해당 이벤트 핸들러에도 updateAllReplyTimes()를 호출하면 됩니다.
});

function updateAllReplyTimes() {
  $('.reply-regdate').each(function() {
    const regdate = $(this).data("reply-regdate");
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