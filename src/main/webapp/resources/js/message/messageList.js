$(document).ready(function() {

    /* modal창 공통 */
    $(window).on("keyup", function(e) {
        if (isModalOn() && e.key === "Escape") {
            modalOff();
        }
        if (isModal2On() && e.key === "Escape") {
            modal2Off();
        }
        if (isModal3On() && e.key === "Escape") {
            modal3Off();
        }
    });

    /* Modal1(쪽지 작성) */
    const modal = $("#modal");
    const btnModal = $(".btn-modal");
    const closeBtn = modal.find(".close-area");

    function isModalOn() {
        return modal.css("display") === "none";
    }
    function modalOn() {
        modal.css("display", "flex");
    }
    function modalOff() {
        modal.css("display", "none");
    }
    btnModal.on("click", function() {
        modalOn();
    });
    closeBtn.on("click", function() {
        modalOff();
    });
    modal.on("click", function(e) {
        if (!$(e.target).closest(".modal-overlay").length) {
            modal1Off();
        }
    });

    /* Modal2(받은 쪽지함) */
    var modalList2 = $(".modal-overlay2");
    const btnModal2 = $(".btn-modal2");
    const closeBtn2 = modalList2.find(".close-area2");

    function isModal2On() {
        return modalList2.css("display") === "none";
    }
    function modal2On() {
        modalList2.css("display", "flex");
    }
    function modal2Off() {
        modalList2.css("display", "none");
    }
    btnModal2.on("click", function() {
        const modalId = $(this).data("modal-id2");
        modalList2 = $("#" + modalId);
        modal2On();
    });
    closeBtn2.on("click", function() {
        modal2Off();
    });
    modalList2.on("click", function(e) {
        if (!$(e.target).closest(".modal-overlay2").length) {
            modal1Off();
        }
    });

    /* Modal3(보낸 쪽지함) */
    var modalList3 = $(".modal-overlay3");
    const btnModal3 = $(".btn-modal3");
    const closeBtn3 = modalList3.find(".close-area3");

    function isModal3On() {
        return modalList3.css("display") === "none";
    }
    function modal3On() {
        modalList3.css("display", "flex");
    }
    function modal3Off() {
        modalList3.css("display", "none");
    }
    btnModal3.on("click", function() {
        const modalId = $(this).data("modal-id3");
        modalList3 = $("#" + modalId);
        modal3On();
    });
    closeBtn3.on("click", function() {
        modal3Off();
    });
    modalList3.on("click", function(e) {
        if (!$(e.target).closest(".modal-overlay3").length) {
            modal1Off();
        }
    });
});

/* 받는 사람 리스트 (그룹별) */
$(document).ready(function(){
    $(".member_class").on('change',function(){
        let byClass = document.getElementById("member_class").value;
        if(member_class === ""){
            document.getElementById("member_class").focus();
            return;
        }
        $.ajax({
            type:"get",
            url: "/message/selectMemByClass",
            data: {member_class: byClass},
            success:
                function(response){
                    var receiver = document.getElementById("receiver");
                    receiver.innerHTML = "";
                    for (var i = 0; i < response.length; i++) {
                        var option = document.createElement("option");
                        option.value = response[i].member_id;
                        option.text = response[i].member_id;
                        receiver.appendChild(option);
                    }
                },
            error:function(request,status,error){
                alert("에러입니다");
            }
        });
    });
});

/* 삭제 버튼(수신함) 눌렀을 때 null값 방지 */
function checkData() {
    var checkbox = document.getElementsByName("message_no");
    var checked = false;
    for (var i = 0; i < checkbox.length; i++) {
        if (checkbox[i].checked) {
            checked = true;
            break;
        }
    }
    if (!checked) {
        alert("삭제할 내용을 선택해주세요.");
        return false;
    }
    return true;
}

/* 삭제(수신함, 발신함) */
$(document).ready(function() {
    $("#delete").click(function() {
        var confirmed = confirm("삭제하시겠습니까?");
        if (confirmed) {
            $("form").submit();
            alert("쪽지가 삭제되었습니다.");
        } else {
            return false;
        }
    });
});

/* 쪽지 작성 */
$(document).ready(function() {
    $("#write").click(function() {
        var confirmed = confirm("쪽지를 보내시겠습니까?");
        if (confirmed) {
            /*$("form").submit();*/
            alert("쪽지가 발송되었습니다.");
        } else {
            return false;
        }
    });
});