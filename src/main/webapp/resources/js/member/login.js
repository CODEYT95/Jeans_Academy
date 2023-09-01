document.addEventListener("DOMContentLoaded", function() {
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        // 패널 전환 시 input 필드 초기화
        clearInputFields();
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        // 패널 전환 시 input 필드 초기화
        clearInputFields();
        container.classList.remove("right-panel-active");
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
                        alert("회원가입 요청중이에요! 잠시만 기다려주세요🙏");
                        return;
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
