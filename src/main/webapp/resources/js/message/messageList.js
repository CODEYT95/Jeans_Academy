$(document).ready(function() {


    const modal = $("#modal");
    const modal2 = $("#modal2");
    const modal3 = $("#modal3");

    const btnModal = $(".btn-modal");
    const btnModal2 = $(".btn-modal2");
    const btnModal3 = $(".btn-modal3");

    const closeBtn = modal.find(".close-area");
    const closeBtn2 = modal2.find(".close-area2");
    const closeBtn3 = modal3.find(".close-area3");

    const modalSenderInput = modal.find("input[name='message_sender']");
    const modalReceiverInput = modal.find("input[name='message_receiver']");
    const modalTitleInput = modal.find("input[name='message_title']");
    const modalContentInput = modal.find("input[name='message_content']");
    const modalDateInput = modal.find("input[name='message_date']");

    function isModalOn() {
        return modal.css("display") === "none";
    }

    function modalOn() {
        modal.css("display", "flex");
    }

    function modalOff() {
        modal.css("display", "none");
    }

    function isModal2On() {
        return modal2.css("display") === "none";
    }

    function modal2On() {
        modal2.css("display", "flex");
    }

    function modal2Off() {
        modal2.css("display", "none");
    }

    function isModal3On() {
        return modal3.css("display") === "none";
    }

    function modal3On() {
        modal3.css("display", "flex");
    }

    function modal3Off() {
        modal3.css("display", "none");
    }

    btnModal.on("click", function() {
        modalOn();
    });

    btnModal2.on("click", function() {
        modal2On();
    });

    btnModal3.on("click", function() {
        modal3On();
    });

    closeBtn.on("click", function() {
        modalOff();
    });

    closeBtn2.on("click", function() {
        modal2Off();
    });

    closeBtn3.on("click", function() {
        modal3Off();
    });

    modal.on("click", function(e) {
        const evTarget = $(e.target);
        if (evTarget.hasClass("modal-overlay")) {
            modalOff();
        }
    });

    modal2.on("click", function(e) {
        const evTarget = $(e.target);
        if (evTarget.hasClass("modal-overlay2")) {
            modal2Off();
        }
    });

    modal3.on("click", function(e) {
        const evTarget = $(e.target);
        if (evTarget.hasClass("modal-overlay3")) {
            modal3Off();
        }
    });

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




});

/* 메시지 수신자 선택 */
document.getElementById("receiver").addEventListener("change", function () {
    var selectedValue = this.value;
    document.querySelector("input[name='message_receiver']").value = selectedValue;
});