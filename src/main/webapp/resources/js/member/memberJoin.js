    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('phone').addEventListener('input', function (e) {
            const input = e.target;
            const value = input.value;
            const formattedValue = phoneNumber(value);
            input.value = formattedValue;
        });

        function phoneNumber(value) {
            value = value.replace(/[^0-9]/g, "");
            return value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
        }

        const studentSignupForm = document.getElementById("studentForm");
        const studentCheckbox = document.getElementById("studentCheckbox");

        studentSignupForm.addEventListener("submit", function(event) {
            const phoneValue = document.getElementById('phone').value;
            const birthValue = document.getElementById('birth').value;

            if (!studentCheckbox.checked) {
                event.preventDefault(); // 폼 제출 막음
                alert("수강생 여부를 확인해주세요.");
            } else if ($("#idError").css("color") === "rgb(255, 0, 0)" || $("#passwordMatchError").css("color") === "rgb(255, 0, 0)"
                            || $('#name').css("color") === "rgb(255, 0, 0)") {
                event.preventDefault(); // 폼 제출 막음
                alert("입력란을 확인해주세요.");
            } else if (!phoneValue || !birthValue) {
                event.preventDefault(); // 폼 제출 막음
                alert("입력란을 확인해주세요.");
            } else {
                alert("회원가입 요청이 완료되었습니다☺️");
            }
        });
    });

    //아이디 유효성 검사
    $(document).ready(function() {
        $("#id").keyup(function() {
            var member_id = $(this).val();

            if (member_id === "") {
                $("#idError").text("아이디를 입력해주세요").css("color", "red");
                return;
            }

            // 정규식을 이용하여 아이디 형식 체크
            if (!/^[a-zA-Z0-9]{6,20}$/.test(member_id)) {
                $("#idError").text("영어와 숫자를 조합한 6~20자를 입력해주세요.").css("color", "red");
                return;
            }

            $.ajax({
                url: "/idDuplicate",
                type: "GET",
                data: { member_id: member_id },
                success: function(response) {
                    if (response === "available") {
                        $("#idError").text("사용 가능한 아이디입니다.").css("color", "green");
                    } else if (response === "duplicate") {
                        $("#idError").text("이미 사용 중인 아이디입니다.").css("color", "red");
                    } else {
                        $("#idError").text("").css("color", "");
                    }
                }
            });
        });

        //비밀번호 유효성 검사
        function showPasswordMatchMessage(message, color) {
            $("#passwordMatchError").text(message).css("color", color);
        }

        $("#member_pw2").keyup(function() {
            var password1 = $("#member_pw").val();
            var password2 = $(this).val();

            if (password1 === "" && password2 === "") {
                showPasswordMatchMessage("", ""); // 둘 다 비어있을 때 초기화
                return;
            }

            if (password1 !== password2) {
                showPasswordMatchMessage("비밀번호가 일치하지 않습니다.", "red");
            } else {
                showPasswordMatchMessage("비밀번호가 일치합니다.", "green");
            }
        });
            $("#member_pw").keyup(function() {
                var password = $(this).val();
                var validPassword = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,25}$/;

                if (!validPassword.test(password)) {
                    $("#passwordError").text("영어, 숫자, @#$%^&+=! 를 조합한 8~25자 비밀번호를 입력해주세요.").css("color", "red");
                } else {
                    $("#passwordError").text("").css("color", ""); // 유효성 검사 통과 시 에러 메시지 초기화
                }
            });

        //이름 유효성 검사
        $("#name").keyup(function() {
            var name = $(this).val();
            var validCharacters = /^[가-힣a-zA-Z]*$/; // 한글과 영어만 입력 가능한 정규식

            if (name === "") {
                $("#nameError").text("이름을 입력해주세요").css("color", "red");
            } else if (!validCharacters.test(name)) {
                $("#nameError").text("한글과 영어만 입력 가능합니다.").css("color", "red");
            } else {
                $("#nameError").text("").css("color", "");
            }
        });

        //전화번호 유효성 검사
        $("#phone").keyup(function() {
            var member_phone = $(this).val();

            if (member_phone === "") {
                $("#phoneError").text("전화번호를 입력해주세요").css("color", "red");
                return;
            }

            $.ajax({
                url: "/phoneDuplicate",
                type: "GET",
                data: { member_phone: member_phone },
                success: function(response) {
                    if (response === "duplicate") {
                        $("#phoneError").text("본인 전화번호를 입력해주세요.").css("color", "red");
                    } else {
                        $("#phoneError").text("").css("color", "");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("AJAX Error:", textStatus, errorThrown);
                }
            });
        });
    });