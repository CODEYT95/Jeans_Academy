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

        $("#findForm").submit(function (event) {
            event.preventDefault(); // 기본 폼 제출 동작을 막습니다.

            var member_name = $("#member_name").val();
            var member_phone = $("#member_phone").val();

            $.ajax({
                type: "POST",
                url: "/findId", // 서버의 컨트롤러 엔드포인트 주소
                data: { member_name: member_name, member_phone: member_phone },
                success: function (response) {
                    // 서버로부터의 응답을 처리합니다.
                    if (response != "0") {
                        $("#result").text(response);
                    } else {
                        $("#result").text("존재하지 않는 회원입니다.");
                    }
                },
                error: function () {
                    $("#result").text("오류가 발생했습니다.");
                }
            });
        });
    });