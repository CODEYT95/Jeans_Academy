// 전역 변수로 member_id 저장
var selectedMemberId;

$(document).ready(function() {
    // .updateBtn 클릭 시 모달 열기
    $(".cancelBtn").on('click', function() {
        selectedMemberId = $(this).data("member-id");
        $("#myModal").css("display", "block");
        $("#myModal p").text(selectedMemberId + " 님 요청을 거절하시겠어요?");
    });

    // .conceal 클릭 시 모달 닫기
    $(".conceal").on('click', function() {
        $("#myModal").css("display", "none");
    });

    // acceptBtn 클릭 시 이벤트
    $(".acceptBtn").on('click', function() {
        var member_id = $(this).data("member-id"); // 해당 버튼의 data-member-id 가져오기

        // AJAX를 사용하여 acceptUpdate 컨트롤러 호출
        $.ajax({
            type: 'GET',
            url: '/acceptUpdate',
            data: { member_id: member_id },
            success: function(result) {
                if (result === 1) {
                    alert('요청을 수락했습니다.');
                    location.reload();
                } else {
                    // 실패한 경우 처리
                    alert('요청 수락에 실패했습니다.');
                }
            },
            error: function() {
                alert('AJAX 요청 중 오류가 발생했습니다.');
            }
        });
    });

    // confirmUpdate 버튼 클릭 시 이벤트
    $(".confirmUpdate").on('click', function() {
        if (selectedMemberId) {
            deleteMember(selectedMemberId);
        }
    });

    function deleteMember(member_id) {
        $.ajax({
            type: 'GET',
            url: '/deleteMember',
            data: { member_id: member_id },
            success: function(result) {
                if (result === 1) {
                    // 성공적으로 삭제되면, 필요한 작업을 수행
                    // 예: 화면 갱신 또는 메시지 표시
                    alert('회원을 삭제했습니다.');
                    location.reload();
                } else {
                    // 실패한 경우 처리
                    alert('회원 삭제에 실패했습니다.');
                }
            },
            error: function() {
                alert('AJAX 요청 중 오류가 발생했습니다.');
            }
        });
    }
});
