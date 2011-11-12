// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {

  $("#gift_message").keyup(function() {
    var length = 160;
    //length = length - $("user_name").length
    length = length - $("#gift_message").val().length
    $("#text_char_count").html(length)
  });

})
