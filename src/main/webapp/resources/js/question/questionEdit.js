document.addEventListener("DOMContentLoaded", function() {
  // "저장" 버튼에 대한 이벤트 리스너
  const saveButton = document.querySelector('.save');
  if (saveButton) {
    saveButton.addEventListener('click', function() {
      // .content의 내용을 가져옴
      var content = document.querySelector('.content').innerHTML;

      // hidden input 필드에 값 설정
      var hiddenInput = document.createElement('input');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'content';
      hiddenInput.value = content;
    });
  } else {
    console.error("클래스가 '.save'인 요소를 찾을 수 없습니다");
  }

  // "사진 추가" 버튼 클릭 시 파일 선택 대화상자 열기
  $('.content-file').click(function() {
    $('#photo-input').trigger('click');
  });

  // photo-input 변경 이벤트 처리
  const photoInput = document.getElementById('photo-input');
  const previewContainer = document.querySelector('.content');

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
    imageElement.classList.add('preview-image');

    previewContainer.appendChild(imageElement);
  }
  $(".save").click(function() {
      const question_no = $('.question_no').val();
      const question_title = $('.title').val();
      const question_content = $('.content').html();
      $.ajax({
          url: "/question/questionDetail",
          type: "POST",
          data: {
              question_no: question_no,
              question_title: question_title,
              question_content: question_content
          },
          success: function(response) {
              if (response === "success") {
                  console.log("게시글 수정 성공");
                  window.location.href="/question/Detail/"+question_no;
              } else {
                  console.log("게시글 수정 실패");
              }
          },
          error: function(xhr, status, error) {
              console.log("게시글 수정 중 에러 발생");
          }
      });
  });
});