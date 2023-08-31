$(document).ready(function() {
  let menu = $('.menu');
  let sidebar = $('.sidebar');
  let mainContent = $('.main--content');

  menu.click(function() {
    sidebar.toggleClass('active');
    mainContent.toggleClass('active');
  });
});