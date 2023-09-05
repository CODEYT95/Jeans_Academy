/* slider */
function moveSlide(direction) {
    let currentSlide = 0;
    const slides = document.querySelectorAll(".carousel-item");
    const maxSlide = slides.length;

    currentSlide += direction;
    if (currentSlide < 0) {
        currentSlide = maxSlide - 1;
    } else if (currentSlide >= maxSlide) {
        currentSlide = 0;
    }

    const slideWidth = slides[0].clientWidth;
    const offset = -currentSlide * slideWidth;
    document.querySelector(".carousel-inner").style.transform = `translateX(${offset}px)`;
}
