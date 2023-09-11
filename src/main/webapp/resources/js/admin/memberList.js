// 전역 변수로 member_id 저장
var selectedMemberId;
var isEditing = false;

$(document).ready(function() {
    // .updateBtn 클릭 시 모달 열기
    $(".updateBtn").on('click', function() {
        selectedMemberId = $(this).data("member-id");
        $("#myModal").css("display", "block");
        $("#myModal p").text(selectedMemberId + " 님을 정말 탈퇴 시키겠어요?");
    });

    // .conceal 클릭 시 모달 닫기
    $(".conceal").on('click', function() {
        $("#myModal").css("display", "none");
    });

    // .modifyBtn 클릭 시 편집 모드 활성화
    $(".modifyBtn").on('click', function() {
        if (isEditing) {
            return; // 이미 수정 중인 경우 클릭 무시
        }
        var $row = $(this).closest('tr');
        var member_id = $(this).data("member-id"); // 해당 버튼의 data-member-id 가져오기
        $row.find('.editable').attr('contenteditable', true).addClass('edit-active');
        $(this).hide(); // modifyBtn 숨기기
        $(this).prop("disabled", true); // 클릭된 modifyBtn 비활성화
        $row.find('.updateBtn').hide(); // updateBtn 숨기기
        $row.find('.updateSuccess').show(); // updateSuccess 표시하기
        $row.find('.preBtn').show(); //preBtn 표시하기

       $(".modifyBtn").not(this).prop("disabled", true);

        isEditing = true; // 수정 중 상태 변수 설정
    });
    // preBtn 클릭 시 이벤트
    $(".preBtn").on('click', function() {
        var $row = $(this).closest('tr');

        $('.updateSuccess').hide();
        $('.preBtn').hide();
        $('.modifyBtn').show(); // modifyBtn 표시하기
        $('.updateBtn').show(); // updateBtn 표시하기

         // 다른 모든 modifyBtn 비활성화
        $(".modifyBtn").not(this).prop("disabled", true);

        // 모든 modifyBtn을 활성화 상태로 초기화
        $(".modifyBtn").prop("disabled", false);

        location.reload();
    });

    // 회원정보 수정
    $(".updateSuccess").on('click', function() {
        var $row = $(this).closest('tr');
        var member_id = $row.find('.modifyBtn').data("member-id"); // 해당 열의 modifyBtn의 data-member-id 가져오기
        var member_name = $row.find('[data-field="member_name"]').text();
        var member_phone = $row.find('[data-field="member_phone"]').text();
        var member_class = $row.find('[data-field="member_class"]').text();
        console.log(member_phone);
        var $clickedButton = $(this); // 클릭된 버튼을 캡처
        // AJAX를 사용하여 수정된 내용을 서버로 전송
        $.ajax({
            type: 'POST',
            url: '/modifyMember',
            data: {
                member_id: member_id,
                member_name: member_name,
                member_phone: member_phone,
                member_class: member_class,
            },
            success: function(result) {
                console.log(member_id);
                if (result === 'success') {
                    alert('회원 정보가 업데이트되었습니다.');
                    $row.find('.editable').attr('contenteditable', false).removeClass('edit-active');
                } else if(result === "duplicate"){
                    alert("전화번호를 확인해주세요.");
                }else{
                    alert('회원 정보 업데이트에 실패했습니다.');
                }
            },
            error: function() {
                alert('AJAX 요청 중 오류가 발생했습니다.');
            }
        });
    });
});

//회원 숨기기
$(document).ready(function() {
    $('.confirmUpdate').click(function() {
        if (selectedMemberId) {
            updateMember(selectedMemberId);
        }
    });

    function updateMember(member_id) {
        $.ajax({
            type: 'GET',
            url: '/updateMember',
            data: { member_id: member_id },
            success: function(result) {
                console.log(member_id);
                if (result === 1) {
                    location.reload();
                } else {
                    alert('회원 정보 업데이트에 실패했습니다.');
                }
            },
            error: function() {
                alert('AJAX 요청 중 오류가 발생했습니다.');
            }
        });
    }
});
$(document).ready(function() {
    // 'editable' 클래스가 있는 'td' 엘리먼트의 내용 수정 시 포맷팅 및 길이 제한 적용
    $(".editable").on('input', function (e) {
        const tdElement = $(this);
        const textContent = tdElement.text();
        const startPos = getCursorPosition(tdElement[0]);

        // 값 포맷팅 및 길이 제한 적용
        let formattedValue = phoneNumber(textContent);
        if (formattedValue.length > 13) {
            formattedValue = formattedValue.substring(0, 13);
        }
        tdElement.text(formattedValue);

        // 커서 위치 다시 설정
        setCursorPosition(tdElement[0], startPos);
    });

    function phoneNumber(value) {
        // 입력된 내용을 전화번호 형식으로 포맷팅
        return value.replace(/(\d{3,3})(\d{4,4})(\d{4,4})/, "$1-$2-$3");
    }

    function getCursorPosition(element) {
        const selection = window.getSelection();
        const range = selection.getRangeAt(0);
        range.setStart(element, 0);
        return range.toString().length;
    }

    function setCursorPosition(element, position) {
        const textNode = element.firstChild; // 텍스트 노드 가져오기
        const range = document.createRange();
        const selection = window.getSelection();

        if (textNode) {
            range.setStart(textNode, Math.min(position, textNode.length)); // 텍스트 노드와 위치 설정
            range.collapse(true);
            selection.removeAllRanges();
            selection.addRange(range);
        }
    }
});
