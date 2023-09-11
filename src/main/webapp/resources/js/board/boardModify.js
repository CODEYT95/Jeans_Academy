$(document).ready(function() {
    $("#save").click(function() {
        var confirmed = confirm("저장하시겠습니까?");
        if (confirmed) {
            $("form").submit();
            alert("글이 수정되었습니다.");
        } else {
            return false;
        }
    });
});

document.addEventListener("DOMContentLoaded", function() {
  const saveButton = document.querySelector('#save');
  if (saveButton) {
    saveButton.addEventListener('click', function() {
      var board1_content = document.querySelector('#board1_content').innerHTML;
      var hiddenInput = document.createElement('input');
      var form = document.querySelector('form');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'board1_content';
      hiddenInput.value = board1_content;
      form.appendChild(hiddenInput);
    });
  } else {
    console.error("사진 업로드 실패");
  }

  $('.content-file').click(function() {
    $('#photo-input').trigger('click');
  });

  const photoInput = document.getElementById('photo-input');
  const previewContainer = document.querySelector('#board1_content');

  if (photoInput && previewContainer) {
    photoInput.addEventListener('change', function(event) {
      const files = event.target.files;
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        if (file.type.startsWith('image/')) {
          const reader = new FileReader();
          reader.onload = function(e) {
            const imageSrc = e.target.result;
            createPreviewImage(imageSrc);
          };
          reader.readAsDataURL(file);
        }
      }
    });
  }

  function createPreviewImage(imageSrc) {
    const imageElement = document.createElement('img');
    imageElement.src = imageSrc;
    previewContainer.appendChild(imageElement);
  }

  $("#save").click(function() {
      const board1_no = $('#board1_no').val();
      const board1_title = $('#board1_title').val();
      const board1_content = $('#board1_content').html();

      alert(board1_title);

      if(board1_title === "" || board1_title === null){
          alert("제목을 작성해주세요");
          return false;
      } else if (board1_content === "" || board1_content === null) {
          alert("내용을 작성해주세요");
          return false;
      } else{
          if (confirm("저장하시겠습니까?")) {
              $("form").submit();
              alert("글이 작성되었습니다.");
          } else {
              return false;
          }
      }
      $.ajax({
          url: "/board1/modify",
          type: "POST",
          data: {
              board1_no: board1_no,
              board1_title: board1_title,
              board1_content: board1_content
          },
          success: function(response) {
              if (response === "success") {
                  console.log("수정 성공");
                  window.location.href = "/board1/detail" + board1_no;
              } else {
                  console.log("수정 실패");
              }
          },
          error: function(xhr, status, error) {
              console.log("에러 발생");
          }
      });
  });
});
