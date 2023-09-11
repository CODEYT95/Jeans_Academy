/* 2반 */

/* 글 작성 여부 확인 */
$(document).ready(function() {
    $("#save").click(function() {

        const board2_title_check = $('#board2_title').val();
        const board2_content_check = $('#board2_content').html();

        if(board2_title_check === "" || board2_title_check === null){
            alert("제목을 작성해주세요");
            return false;
        } else if (board2_content_check === "" || board2_content_check === null) {
            alert("내용을 작성해주세요");
            return false;
        } else{
            if (confirm("저장하시겠습니까?")) {
                $("form").submit();
            } else {
                return false;
            }
        }
    });
});

/* 글 작성 (사진 첨부) */
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
    console.error("업로드 실패");
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
    imageElement.classList.add('preview-image');
    previewContainer.appendChild(imageElement);
  }
});


/* 2반 */

/* 글 작성 여부 확인 */
$(document).ready(function() {
    $("#save2").click(function() {

        const board2_title_check = $('#board2_title').val();
        const board2_content_check = $('#board2_content').html();

        if(board2_title_check === "" || board2_title_check === null){
            alert("제목을 작성해주세요");
            return false;
        } else if (board2_content_check === "" || board2_content_check === null) {
            alert("내용을 작성해주세요");
            return false;
        } else{
            if (confirm("저장하시겠습니까?")) {
                $("form").submit();
            } else {
                return false;
            }
        }
    });
});

/* 글 작성 (사진 첨부) */
document.addEventListener("DOMContentLoaded", function() {
  const saveButton2 = document.querySelector('#save2');
  if (saveButton2) {
    saveButton2.addEventListener('click', function() {
      var board2_content = document.querySelector('#board2_content').innerHTML;
      var hiddenInput = document.createElement('input');
      var form = document.querySelector('form');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'board2_content';
      hiddenInput.value = board2_content;
      form.appendChild(hiddenInput);
    });
  } else {
    console.error("업로드 실패");
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
    imageElement.classList.add('preview-image');
    previewContainer.appendChild(imageElement);
  }
});

/* 3반 */

/* 글 작성 여부 확인 */
$(document).ready(function() {
    $("#save3").click(function() {

        const board3_title_check = $('#board3_title').val();
        const board3_content_check = $('#board3_content').html();

        if(board3_title_check === "" || board3_title_check === null){
            alert("제목을 작성해주세요");
            return false;
        } else if (board3_content_check === "" || board3_content_check === null) {
            alert("내용을 작성해주세요");
            return false;
        } else{
            if (confirm("저장하시겠습니까?")) {
                $("form").submit();
            } else {
                return false;
            }
        }
    });
});

/* 글 작성 (사진 첨부) */
document.addEventListener("DOMContentLoaded", function() {
  const saveButton3 = document.querySelector('#save3');
  if (saveButton3) {
    saveButton3.addEventListener('click', function() {
      var board3_content = document.querySelector('#board3_content').innerHTML;
      var hiddenInput = document.createElement('input');
      var form = document.querySelector('form');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'board3_content';
      hiddenInput.value = board3_content;
      form.appendChild(hiddenInput);
    });
  } else {
    console.error("업로드 실패");
  }

  $('.content-file').click(function() {
    $('#photo-input').trigger('click');
  });

  const photoInput = document.getElementById('photo-input');
  const previewContainer = document.querySelector('#board3_content');

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
});

/* 4반 */

/* 글 작성 여부 확인 */
$(document).ready(function() {
    $("#save4").click(function() {

        const board4_title_check = $('#board4_title').val();
        const board4_content_check = $('#board4_content').html();

        if(board4_title_check === "" || board4_title_check === null){
            alert("제목을 작성해주세요");
            return false;
        } else if (board4_content_check === "" || board4_content_check === null) {
            alert("내용을 작성해주세요");
            return false;
        } else{
            if (confirm("저장하시겠습니까?")) {
                $("form").submit();
            } else {
                return false;
            }
        }
    });
});

/* 글 작성 (사진 첨부) */
document.addEventListener("DOMContentLoaded", function() {
  const saveButton4 = document.querySelector('#save4');
  if (saveButton4) {
    saveButton.addEventListener('click', function() {
      var board4_content = document.querySelector('#board4_content').innerHTML;
      var hiddenInput = document.createElement('input');
      var form = document.querySelector('form');
      hiddenInput.type = 'hidden';
      hiddenInput.name = 'board4_content';
      hiddenInput.value = board4_content;
      form.appendChild(hiddenInput);
    });
  } else {
    console.error("업로드 실패");
  }

  $('.content-file').click(function() {
    $('#photo-input').trigger('click');
  });

  const photoInput = document.getElementById('photo-input');
  const previewContainer = document.querySelector('#board4_content');

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
});