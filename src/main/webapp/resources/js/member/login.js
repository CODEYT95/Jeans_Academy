    document.addEventListener("DOMContentLoaded", function() {
        const teacherLoginButton = document.getElementById('teacherLogin');
        const studentLoginButton = document.getElementById('studentLogin');
        const container = document.getElementById('container');
        const teachereyeIcon = document.querySelector(".eye-icon");
        const studenteyeIcon = document.querySelector(".eye-icon2");

        teacherLoginButton.addEventListener('click', () => {
            // 패널 전환 시 input 필드 초기화
            clearInputFields();
            container.classList.add("right-panel-active");
            studenteyeIcon.style.display ="none";
        });

        studentLoginButton.addEventListener('click', () => {
            // 패널 전환 시 input 필드 초기화
            clearInputFields();
            container.classList.remove("right-panel-active");
            teachereyeIcon.style.display ="none";
        });

        const teacherSignup = document.getElementById('teacherSignup');
        const studentSignup = document.getElementById('studentSignup');

        teacherSignup.addEventListener('click', (event) => {
            event.preventDefault();
            window.location.href = "/teacher";
        });

        studentSignup.addEventListener('click', (event) => {
            event.preventDefault();
            window.location.href = "/student";
        });

        $(document).ready(function() {
            $(".login").click(function(event) {
                event.preventDefault();

                const form = $(this).closest('form');
                const member_id = form.find(".teacherId, .studentId").val();
                const member_pw = form.find(".teacherPw, .studentPw").val();
                const member_type = form.find("input[name='member_type']").val();

                // 간단한 클라이언트 측 유효성 검사 (예: 필수 입력 체크)
                if (!member_id || !member_pw || !member_type) {
                    if (form.attr('id') === 'teacherForm') {
                        $("#ErrorTeacher").text("아이디랑 비밀번호 모두 입력해주세요.");
                    } else if (form.attr('id') === 'studentForm') {
                        $("#ErrorStudent").text("아이디랑 비밀번호 모두 입력해주세요.");
                    }
                    return;
                }

                $.ajax({
                    url: "/login",
                    type: "POST",
                    data: {
                        'member_id': member_id,
                        'member_pw': member_pw,
                        'member_type': member_type
                    },
                    success: function(response) {
                        console.log("Member Type:", member_type);
                        var intValue = parseInt(response);
                        if (intValue === 1) {
                            alert("로그인 되었습니다👏");
                            window.location.href = "/main1";
                        } else if (intValue === 5) {
                            if (form.attr('id') === 'teacherForm') {
                                $("#ErrorTeacher").text("존재하지 않는 회원입니다.");
                            } else if (form.attr('id') === 'studentForm') {
                                $("#ErrorStudent").text("존재하지 않는 회원입니다.");
                            }
                            return;
                        } else if(intValue === 4) {
                            if (form.attr('id') === 'teacherForm') {
                                $("#ErrorTeacher").text("아이디나 비밀번호가 틀립니다.");
                            } else if (form.attr('id') === 'studentForm') {
                                $("#ErrorStudent").text("아이디나 비밀번호가 틀립니다.");
                            }
                            return;
                        } else if(intValue === 3){
                            if (form.attr('id') === 'teacherForm') {
                                $("#ErrorTeacher").text("회원 가입 요청 처리중이거나 탈퇴한 회원입니다.");
                            } else if (form.attr('id') === 'studentForm') {
                                $("#ErrorStudent").text("회원 가입 요청 처리중이거나 탈퇴한 회원입니다.");
                            }
                        } else if(intValue === 2){
                            if (form.attr('id') === 'teacherForm') {
                                $("#ErrorTeacher").text("강사님이나 관리자가 아닙니다.");
                            } else if (form.attr('id') === 'studentForm') {
                                $("#ErrorStudent").text("수강생이 아닙니다.");
                            }
                        }
                        else{
                            alert("다시 시도해주세요.");
                            window.location.href = "/login";
                        }
                    }
                });
            });
        });

        function clearInputFields() {
            // input 필드 초기화
            $(".teacherId, .studentId, .teacherPw, .studentPw").val("");
            $("#ErrorTeacher, #ErrorStudent").text(""); // 에러 메시지 초기화
        }
    });
        //비밀번호 type 전환 기능
        document.addEventListener("DOMContentLoaded", function() {
          const teacherPassword = document.querySelector(".teacherPw");
          const studentPassword = document.querySelector(".studentPw");
          const teachereyeIcon = document.querySelector(".eye-icon");
          const studenteyeIcon = document.querySelector(".eye-icon2");

          // 선생님 비밀번호 눈 아이콘 클릭 이벤트
          teachereyeIcon.addEventListener("click", function() {
            if (teacherPassword.type === "password") {
              teacherPassword.type = "text";
              teachereyeIcon.innerHTML = '<ion-icon name="eye-off-outline"></ion-icon>';
            } else {
              teacherPassword.type = "password";
              teachereyeIcon.innerHTML = '<ion-icon name="eye-outline"></ion-icon>';
            }
          });

           // 학생 비밀번호 눈 아이콘 클릭 이벤트
           studenteyeIcon.addEventListener("click", function() {
             if (studentPassword.type === "password") {
               studentPassword.type = "text";
               studenteyeIcon.innerHTML = '<ion-icon name="eye-off-outline"></ion-icon>';
             } else {
               studentPassword.type ="password";
               studenteyeIcon.innerHTML ="<ion-icon name='eye-outline'></ion-icon>";
             }
           });

           // 선생님 비밀번호 입력 필드에 입력 이벤트 리스너 추가하여 값이 비어 있는지 확인
           teacherPassword.addEventListener("input", function() {
             if (teacherPassword.value.trim() === "") {
               teachereyeIcon.style.display ="none";
             } else {
               teachereyeIcon.style.display ="block";
             }
           });

           // 학생 비밀번호 입력 필드에 입력 이벤트 리스너 추가하여 값이 비어 있는지 확인
           studentPassword.addEventListener("input", function() {
             if (studentPassword.value.trim() === "") {
               studenteyeIcon.style.display ="none";
             } else {
                studenteyeIcon.style.display ="block";
              }
            });
        });

function new_window(type) {
  let windowName = type;
  let left = (type === 'findId') ? 750 : 850;

  window.open(
    "/" + type,  // URL 수정
    windowName,
    "width=400, height=350, top=400, left=" + left
  );
}