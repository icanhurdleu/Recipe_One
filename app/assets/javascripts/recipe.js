jQuery(document).on( "turbolinks:load", function() {
	// setTimeout(function(){
	// 	$('#flash-notice').remove();
	// }, 5000);

	// Check for click events on the navbar burger icon
	$(".navbar-burger").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

  });

  $('#search-box').keyup(function() {
  	var matcher = new RegExp($(this).val(), 'gi');
  	$('.recipe-holder').show().not(function() {
  		return matcher.test($(this).find('.title').text());
  	}).hide();
  });

});