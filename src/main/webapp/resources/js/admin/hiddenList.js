// 전역 변수로 member_id 저장
var selectedMemberId;

$(document).ready(function() {
    // .updateBtn 클릭 시 모달 열기
    $(".deleteBtn").on('click', function() {
        selectedMemberId = $(this).data("member-id");
        $("#myModal").css("display", "block");
        $("#myModal p").text(selectedMemberId + " 님을 완전 삭제하시겠어요?");
    });

    // .conceal 클릭 시 모달 닫기
    $(".conceal").on('click', function() {
        $("#myModal").css("display", "none");
    });

    // acceptBtn 클릭 시 이벤트
    $(".refreshBtn").on('click', function() {
        var member_id = $(this).data("member-id");

        $.ajax({
            type: 'GET',
            url: '/refreshMember',
            data: { member_id: member_id },
            success: function(result) {
                if (result === 1) {
                    alert('회원을 복구 했습니다.');
                    location.reload();
                } else {
                    // 실패한 경우 처리
                    alert('회원 복구에 실패했습니다.');
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
                    alert('회원을 삭제했습니다.');
                    location.reload();
                } else {
                    alert('회원 삭제에 실패했습니다.');
                }
            },
            error: function() {
                alert('AJAX 요청 중 오류가 발생했습니다.');
            }
        });
    }
});