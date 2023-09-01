// login.js
document.addEventListener("DOMContentLoaded", function() {
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

    const teacherSignup = document.getElementById('teacherSignup');
    const studentSignup = document.getElementById('studentSignup');

    teacherSignup.addEventListener('click',(event) => {
        event.preventDefault();
        window.location.href = "/teacher"
    });

    studentSignup.addEventListener('click',(event) => {
        event.preventDefault();
        window.location.href = "/student"
    });
});

$(document).ready(function() {
    $(".login").click(function(event) {
        event.preventDefault();

    const member_id = $(this).parents('form').find(".teacherId, .studentId").val();
    const member_pw = $(this).parents('form').find(".teacherPw, .studentPw").val();
    const member_type = $(this).parents('form').find("input[name='member_type']").val();


        // AJAX 요청 및 처리
        $.ajax({
            url: "/login", // 로그인 처리 URL
            type: "POST", // POST 방식 요청
            data: {
                member_id: member_id,
                member_pw: member_pw,
                member_type: member_type,
            },
            success: function(response) {
            console.log(response);
                if (response == 1) {
                    // 로그인 성공 시 처리 로직
                    alert("로그인 되었습니다!");
                    window.location.href = "/main/main"; // 로그인 후 이동할 페이지
                } else {
                    // 로그인 실패 시 처리 로직
                    $("#loginErrorTeacher").text("로그인 실패").css("color", "red");
                }
            }
        });
    });

    // 나머지 코드...
});
