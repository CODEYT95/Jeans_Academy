$(document).ready(function() {
    $("#save").click(function() {
        var confirmed = confirm("저장하시겠습니까?");
        if (confirmed) {
            $("form").submit();
            alert("글이 수정되었습니다.");
        } else {
            return false;
        }
    });
});