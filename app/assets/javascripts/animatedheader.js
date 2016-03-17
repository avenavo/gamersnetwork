$(function(){
  $(window).scroll(function(){
    var winTop = $(window).scrollTop();
    if(winTop >= 20){
      $("body").addClass("sticky-header");
    }else{
      $("body").removeClass("sticky-header");
    }//if-else
  });//win func.
});//ready func.



$(function () {
    $('.navbar-toggler').on('click', function(event) {
    event.preventDefault();
    $(this).closest('.navbar-minimal').toggleClass('open');
  })
});