    $(document).ready(function () {
        $("#member_phone").on("input", function() {
            var phoneNumber = $(this).val();
            phoneNumber = phoneNumber.replace(/[^0-9]/g, ''); // 숫자만 추출

            if (phoneNumber.length > 0) {
                if (phoneNumber.length > 3) {
                    phoneNumber = phoneNumber.substring(0, 3) + '-' + phoneNumber.substring(3);
                }
                if (phoneNumber.length > 8) {
                    phoneNumber = phoneNumber.substring(0, 8) + '-' + phoneNumber.substring(8);
                }
            }

            $(this).val(phoneNumber);
        });

    $("#member_id").on("input", function() {
        var id = $(this).val();
        id = id.replace(/[^a-zA-Z0-9]/g, ''); // 영어와 숫자만 추출
        $(this).val(id);
    });
});

$(document).ready(function () {
        var modifyBtn = $("#modifyBtn");

            $("#member_id, #member_phone").on("keyup", function () {
                var member_id = $("#member_id").val();
                var member_phone = $("#member_phone").val();

                if (member_id !== "" && member_phone !== "") {
                    modifyBtn.css("background-color", "#5073FB"); // 배경색 변경
                } else {
                    modifyBtn.css("background-color", "#9497a1");
                }
            });

            $("#findForm").on("submit", function (e) {
                e.preventDefault(); // 폼의 기본 제출 동작을 막음

                var member_id = $("#member_id").val();
                var member_phone = $("#member_phone").val();

                $.ajax({
                    type: "POST",
                    url: "/findPw",
                    data: { member_id: member_id, member_phone: member_phone },
                    success: function (response) {
                        if (response === member_id) {
                            $("#findForm").hide();
                            $("#updateForm").show();
                            $("#member_id_hidden").val(member_id); // 아이디를 hidden 필드에 설정
                        } else {
                            $("#errorMsg").text("아이디나 전화번호가 틀렸습니다.");
                        }
                    },
                    error: function () {
                        alert("서버 에러");
                    },
                });
            });
    // 비밀번호 수정 폼 제출
    $("#updateForm").submit(function (event) {
        event.preventDefault(); // 기본 폼 제출 동작을 막습니다.

        var member_id = $("#member_id_hidden").val();
        console.log(member_id);
        var member_pw = $("#member_pw").val();

        if (member_pw !== "") {
            $.ajax({
                type: "POST",
                url: "/updatePw", // 서버의 컨트롤러 엔드포인트 주소
                data: { member_id: member_id, member_pw: member_pw },
                success: function (response) {
                    console.log(member_id);
                    var intVal = parseInt(response);
                    if (intVal === 1) {
                        // 비밀번호 수정 성공 시 처리
                         $('#myModal').css('display', 'block');
                    } else {
                        // 비밀번호 수정 실패 시 처리
                        $("#errorMsg2").text("이상한 비번.");
                    }
                },
                error: function () {
                    $("#errorMsg2").text("오류가 발생했습니다.");
                },
            });
        } else {
            $("#errorMsg2").text("새 비밀번호를 입력해주세요.");
        }
    });
});
$(document).ready(function() {
   // 확인 버튼 클릭 시 이벤트 핸들러 (삭제 작업 처리)
   $('#confirmDelete').click(function() {
         // Modal 숨기기
         $('#myModal').css('display', 'none');
         window.close();
   });
function showPasswordMatchMessage(message, color) {
    $("#errorMsg2").text(message).css("color", color);
}

// 비밀번호가 일치하는지 확인하는 함수
function checkPasswordMatch() {
    var password1 = $("#member_pw").val();
    var password2 = $("#check_new_pw").val();
    var updatePwButton = $("#updatePw"); // 버튼 요소 저장

    if (password1 === "" || password2 === "") {
        // 하나 이상의 비밀번호 필드가 비어있을 때
        showPasswordMatchMessage("", ""); // 초기화
        updatePwButton.prop("disabled", true); // 버튼 비활성화
        updatePwButton.css("background-color", ""); // 배경색 초기화
    } else {
        var validPassword = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{6,20}$/;
        if (!validPassword.test(password1)) {
            // 비밀번호가 유효하지 않거나 두 비밀번호가 일치하지 않을 때
            showPasswordMatchMessage("영어, 숫자, @#$%^&+=! 를 조합한 6~20자 비밀번호를 입력해주세요.", "red");
            updatePwButton.prop("disabled", true); // 버튼 비활성화
            updatePwButton.css("background-color", ""); // 배경색 초기화
        } else {
            if (password1 !== password2) {
                showPasswordMatchMessage("비밀번호가 일치하지 않습니다", "red");
                updatePwButton.prop("disabled", true); // 버튼 비활성화
                updatePwButton.css("background-color", ""); // 배경색 초기화
            } else {
                // 비밀번호가 일치하고 유효할 때
                showPasswordMatchMessage("비밀번호가 일치합니다.", "green");
                updatePwButton.css("background-color", "#5073FB"); // 배경색 변경
                updatePwButton.prop("disabled", false); // 버튼 활성화
            }
        }
    }
}

$("#check_new_pw").keyup(checkPasswordMatch);
$("#member_pw").keyup(checkPasswordMatch);
});
            //비밀번호 type 전환 기능
            $(document).ready(function() {
                 const memberPassword = document.querySelector("#member_pw");
                 const passwordCheck = document.querySelector("#check_new_pw");
                 const memberPasswordIcon = document.querySelector(".eye-icon");
                 const passwordCheckIcon = document.querySelector(".eye-icon2");

                 // 비밀번호 눈 아이콘 클릭 이벤트
                 memberPasswordIcon.addEventListener("click", function() {
                   if (memberPassword.type === "password") {
                     memberPassword.type = "text";
                     memberPasswordIcon.innerHTML = '<ion-icon name="eye-off-outline"></ion-icon>';
                   } else {
                     memberPassword.type = "password";
                     memberPasswordIcon.innerHTML = '<ion-icon name="eye-outline"></ion-icon>';
                   }
                 });

                  // 비밀번호 확인 눈 아이콘 클릭 이벤트
                  passwordCheckIcon.addEventListener("click", function() {
                    if (passwordCheck.type === "password") {
                      passwordCheck.type = "text";
                      passwordCheckIcon.innerHTML = '<ion-icon name="eye-off-outline"></ion-icon>';
                    } else {
                      passwordCheck.type ="password";
                      passwordCheckIcon.innerHTML ="<ion-icon name='eye-outline'></ion-icon>";
                    }
                  });

                  // 비밀번호 입력 필드에 입력 이벤트 리스너 추가하여 값이 비어 있는지 확인
                  memberPassword.addEventListener("input", function() {
                    if (memberPassword.value.trim() === "") {
                      memberPasswordIcon.style.display ="none";
                    } else {
                      memberPasswordIcon.style.display ="block";
                    }
                  });

                  // 비밀번호 확인 입력 필드에 입력 이벤트 리스너 추가하여 값이 비어 있는지 확인
                  passwordCheck.addEventListener("input", function() {
                    if (passwordCheck.value.trim() === "") {
                      passwordCheckIcon.style.display ="none";
                    } else {
                       passwordCheckIcon.style.display ="block";
                     }
                   });
               });