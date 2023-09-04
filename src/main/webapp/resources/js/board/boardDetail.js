
$(document).ready(function() {

    /* 메뉴 공통 기능 */
    let menu = $('.menu');
    let sidebar = $('.sidebar');
    let mainContent = $('.main--content');
    menu.click(function() {
        sidebar.toggleClass('active');
        mainContent.toggleClass('active');
    });

    /* 모달창 */
    const modal = $("#modal");
    const btnModal = $(".btn-modal");
    const modalCommentNoInput = modal.find("input[name='comment1_no']");
    const modalCommentContentInput = modal.find("input[name='comment1_content']");

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
        const commentNo = $(this).data("comment-no");
        const commentContent = $(this).closest("li").find(".col-1").text(); // 댓글 내용 가져오기

        modalCommentNoInput.val(commentNo);
        modalCommentContentInput.val(commentContent);                       // 모달 창에 데이터 설정

            modal.css("display", "flex");
    });

    closeBtn.on("click", function() {
        modalOff();
    });

    modal.on("click", function(e) {
        const evTarget = $(e.target);
        if (evTarget.hasClass("modal-overlay")) {
            modalOff();
        }
    });

    $(window).on("keyup", function(e) {
        if (isModalOn() && e.key === "Escape") {
            modalOff();
        }
    });
});

