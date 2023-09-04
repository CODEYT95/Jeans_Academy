$(document).ready(function() {
  let menu = $('.menu');
  let sidebar = $('.sidebar');
  let mainContent = $('.main--content');

  menu.click(function() {
    sidebar.toggleClass('active');
    mainContent.toggleClass('active');
  });
});
/*
document.addEventListener("DOMContentLoaded", function() {
  // Selecting DOM elements
  const startBtn = document.querySelector("#startBtn");
  const endBtn = document.querySelector("#endBtn");
  const prevNext = document.querySelectorAll(".prevNext");
  const numbers = document.querySelectorAll(".link");

   // Setting the number of items per page
   const itemsPerPage = 15;

   // Getting the total number of items
   const totalItems = `${noticeList.length}`;

   // Calculating the total number of pages
   let totalPages=Math.ceil(totalItems/itemsPerPage);

   // Function to update the button states and display data for the current page
   const updatePageData=()=>{
     if(currentStep===0){
       startBtn.disabled=true;
       prevNext[0].disabled=true;
     }else{
       startBtn.disabled=false;
       prevNext[0].disabled=false;
     }

     if(currentStep===totalPages-1){
       endBtn.disabled=true;
       prevNext[1].disabled=true;

      // Display a message if there are no more items to show
      if(totalItems>0 && currentStep*itemsPerPage>=totalItems){
        const message=document.createElement("li");
        message.textContent="마지막 페이지입니다.";
        listContainer.appendChild(message);
      }
     }else{
       endBtn.disabled=false;
       prevNext[1].disabled=false;
     }

     // Calculate the range of items to display for the current page
      const startIndex=currentStep*itemsPerPage;
      const endIndex=Math.min((currentStep+1)*itemsPerPage,totalItems);

      // Get a reference to the <ul> element that contains the list of items
      const listContainer=document.querySelector(".subject-line ul");

      // Clear the previous items
      listContainer.innerHTML="";

      // Display the items for the current page
      for(let i=startIndex; i<endIndex; i++){
        const notice=noticeList[i];
        const listItem=document.createElement("li");
        listItem.innerHTML=`
          <span class="no">${notice.notice_no}</span>
          <a class="view-link">
            <span class="title">${notice.notice_title}</span>
          </a>
          <div class="writer-container">
            <span class="writer">${notice.member_name}</span>
          </div>
          <span class="reg">${notice.notice_regdate}</span>
          <span class="count">111</span>`;
        listContainer.appendChild(listItem);
      }

     // Display a message if there are no items to show
     if(totalItems===0){
       const emptyMessage=document.createElement("li");
       emptyMessage.textContent = "게시글이 없습니다.";
       listContainer.appendChild(emptyMessage);
     }
   };

   // Function to update the button states and active link
   const updateBtn = () => {
     numbers.forEach((number, numIndex) => {
       number.classList.toggle("active", numIndex === currentStep);
     });

     updatePageData();
   };

   // Add event listeners to the number links
   numbers.forEach((number, numIndex) => {
     number.addEventListener("click", (e) => {
       e.preventDefault();
       currentStep=numIndex;

       updateBtn();
     });
   });

  // Add event listeners to the "Previous" and "Next" buttons
  prevNext.forEach((button) => {
    button.addEventListener("click", (e) => {

      currentStep += e.target.id === "next" ?1 : -1;

      if(currentStep<0){
        currentStep=0;
      }else if(currentStep>=totalPages){
        currentStep=totalPages-1;

        // Load more data if there are more pages to show
        if(totalItems>0 && (currentStep+1)*itemsPerPage>=totalItems){
          loadMoreData();
        }
      }

      updateBtn();
    });
  });

  // Add event listener to the "Start" button
  startBtn.addEventListener("click", () =>{
    currentStep=0;

    updateBtn();
  });

  // Add event listener to the "End" button
  endBtn.addEventListener("click", () =>{
    currentStep=totalPages-1;

    // Load more data if there are more pages to show
    if(totalItems>0 && (currentStep+1)*itemsPerPage>=totalItems){
      loadMoreData();
    }

    updateBtn();
  });

   // Initial page data display
   updatePageData();

   // Function to load more data for the next page
   const loadMoreData = () => {
     const nextPage = Math.ceil(totalItems / itemsPerPage);

     $.ajax({
       url: "/load-more-data",
       type: "GET",
       data: { page: nextPage },
       success: function(response) {
         const newNoticeList = response.noticeList;
         noticeList.push(...newNoticeList);

         totalPages=Math.ceil(noticeList.length / itemsPerPage);

         updatePageData();
       },
       error: function(error) {
         console.log(error);
       }
     });
   };
});
*/