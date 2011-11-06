// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#news .pagination a").live("click", function() {
	$.getScript(this.href);
	return false;
  });
});

$(document).ready(function(){
    $('.skins').click(function(){
      $('.skins').animate({opacity: 1 }, 500);
      $(this).animate({opacity: 0.67 }, 500);
      wybranyskin = $(this).attr("id");
      $('#skin').val('value', wybranyskin);
      $('#player_skin').val(wybranyskin);
    });
});