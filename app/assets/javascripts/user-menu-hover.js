window.addEventListener('DOMContentLoaded', function(){
  $(document).on('click', '.user-menu li', function() {
    $('.user-menu li').removeClass("active");
    $(this).addClass("active");
  });
});