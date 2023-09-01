$(document).ready(function() {
  let menu = $('.menu');
  let sidebar = $('.sidebar');
  let mainContent = $('.main--content');

  menu.click(function() {
    sidebar.toggleClass('active');
    mainContent.toggleClass('active');
  });

  document.querySelector('.save').addEventListener('click', function() {
    // .content의 내용을 가져옴
    var content = document.querySelector('.content').innerHTML;

    // hidden input 필드에 값 설정
    var hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.name = 'content';
    hiddenInput.value = content;

    // form에 hidden input 필드 추가
     var form = document.querySelector('form');
     form.appendChild(hiddenInput);
  });

  // "사진 추가" 버튼 클릭 시 파일 선택 대화상자 열기
  $('.content-file').click(function() {
     $('#photo-input').trigger('click');
   });

   // photo-input 변경 이벤트 처리
   const photoInput = document.getElementById('photo-input');
   const previewContainer = document.querySelector('.content');

   photoInput.addEventListener('change', function(event) {
     const files = event.target.files;

     for (let i = 0; i < files.length; i++) {
       const file = files[i];

       if (file.type.startsWith('image/')) {
         const reader = new FileReader();

         reader.onload = function(e) {
           const imageSrc= e.target.result;
           createPreviewImage(imageSrc);
         };

         reader.readAsDataURL(file);
       }
     }
   });

   function createPreviewImage(imageSrc) {
     const imageElement= document.createElement( 'img' );
     imageElement.src= imageSrc;
     imageElement.classList.add( 'preview-image' );

     previewContainer.appendChild(imageElement);
   }
});
