document.addEventListener("DOMContentLoaded", function() {
  const saveButton = document.querySelector('#save');
  if (saveButton) {
    saveButton.addEventListener('click', function() {
      var board2_content = document.querySelector('#board2_content').innerHTML;
      var hiddenInput = document.createElement('input');
      var form = document.querySelector('form');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'board2_content';
      hiddenInput.value = board2_content;
      form.appendChild(hiddenInput);
    });
  } else {
    console.error("사진 업로드 실패");
  }

  $('.content-file').click(function() {
    $('#photo-input').trigger('click');
  });

  const photoInput = document.getElementById('photo-input');
  const previewContainer = document.querySelector('#board2_content');

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
      const board2_no = $('#board2_no').val();
      const board2_title = $('#board2_title').val();
      const board2_content = $('#board2_content').html();

      if(board2_title === "" || board2_title === null){
          alert("제목을 작성해주세요");
          return false;
      } else if (board2_content === "" || board2_content === null) {
          alert("내용을 작성해주세요");
          return false;
      } else{
          if (confirm("저장하시겠습니까?")) {
              $("form").submit();
              alert("글이 수정되었습니다.");
          } else {
              return false;
          }
      }
      $.ajax({
          url: "/board2/modify",
          type: "POST",
          data: {
              board2_no: board2_no,
              board2_title: board2_title,
              board2_content: board2_content
          },
          success: function(response) {
              if (response === "success") {
                  console.log("수정 성공");
                  window.location.href = "/board2/detail" + board2_no;
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