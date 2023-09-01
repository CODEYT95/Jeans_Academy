$(document).ready(function() {
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

$(document).ready(function() {
  $(".login").click(function(event) {
      event.preventDefault();

      const form = $(this).closest('form');
      const member_id = form.find(".teacherId, .studentId").val();
      const member_pw = form.find(".teacherPw, .studentPw").val();
      const member_type = form.find("input[name='member_type']").val();

      console.log(member_id);
      console.log(member_pw);
      console.log(member_type);

      $.ajax({
          url: "/login",
          type: "POST",
          data: {
              'member_id': member_id,
              'member_pw': member_pw,
              'member_type': member_type
          },
          success: function(response) {
          var intValue = parseInt(response);
              if (intValue == 1) {
                  alert("로그인 되었습니다!");
                  window.location.href = "/main/main";
              } else {
                console.log("로그인 실패")
                alert("로그인 실패");
                  $("#loginErrorTeacher").text("로그인 실패").css("color", "red");
              }
          }
      });
  });
});
  });
