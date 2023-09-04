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