/**
 *
 */
// login.js
document.addEventListener("DOMContentLoaded", function() {
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

    const teacherSignup = document.getElementById('teacherSignup');
    const studentSignup = document.getElementById('studentSignup');

    teacherSignup.addEventListener('click',(event) => {
        event.preventDefault();
        window.location.href = "/teacher"
    });

    studentSignup.addEventListener('click',(event) => {
        event.preventDefault();
        window.location.href = "/student"
    });
});

