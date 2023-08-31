$(document).ready(function() {
  let menu = $('.menu');
  let sidebar = $('.sidebar');
  let mainContent = $('.main--content');

  menu.click(function() {
    sidebar.toggleClass('active');
    mainContent.toggleClass('active');
  });
});

document.addEventListener("DOMContentLoaded", function() {
  // Selecting DOM elements
  const startBtn = document.querySelector("#startBtn");
  const endBtn = document.querySelector("#endBtn");
  const prevNext = document.querySelectorAll(".prevNext");
  const numbers = document.querySelectorAll(".link");

  // Setting an initial step
  let currentStep = 0;

  // Function to update the button states
  const updateBtn = () => {
    if (currentStep === 4) {
      endBtn.disabled = true;
      prevNext[1].disabled = true;
    } else if (currentStep === 0) {
      startBtn.disabled = true;
      prevNext[0].disabled = true;
    } else {
      endBtn.disabled = false;
      prevNext[1].disabled = false;
      startBtn.disabled = false;
      prevNext[0].disabled = false;
    }
   };

   // Add event listeners to the number links
   numbers.forEach((number, numIndex) => {
     number.addEventListener("click", (e) => {
       e.preventDefault();
       currentStep=numIndex;

       document.querySelector(".active").classList.remove("active");
       number.classList.add("active");

       updateBtn();
     });
   });

   // Add event listeners to the "Previous" and "Next" buttons
   prevNext.forEach((button) => {
     button.addEventListener("click", (e) => {

       currentStep += e.target.id === "next" ?1 : -1;

        numbers.forEach((number, numIndex) => {

          number.classList.toggle("active", numIndex === currentStep);
          updateBtn();
        });
     });
   });

   // Add event listener to the "Start" button
   startButton.addEventListener("click", () =>{
     document.querySelector(".active").classList.remove("active");
     numbers[0].classList.add("active");

     currentStep=0;

     updateButton();
     
     endButton.disabled=false;
     prevNext[1].disabled=false; 
   });

// Add event listener to the "End" button

endButton.addEventListener ("click", () =>{
  
document.querySelector(". active"). classList. remove (" active") ;
numbers [4] . classList. add (" active") ;
current Step=4 ;

update Button ();
start Button . disabled= false ;
prev Next [0] . disabled= false ; 

});
});
