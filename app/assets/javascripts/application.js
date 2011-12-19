// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


function stripeResponseHandler(status, response) {
    if (response.error) {
        //show the errors on the form
        $(".payment-errors").html(response.error.message);
        $('#pay-button').removeAttr("disabled");
    } else {
        var form$ = $("#payment-form");
        // token contains id, last4, and card type
        var token = response['id'];
        // insert the token into the form so it gets submitted to the server
        form$.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
        // and submit
        form$.get(0).submit();
    }
}
$(function() {

  $("#gift_message").keyup(function() {
    var length = 160;
    //length = length - $("user_name").length
    length = length - $("#gift_message").val().length
    $("#text_char_count").html(length + " characters left")
  });

  $(".vendor_button").click(function(event) {
    var button_id = event.target.id;
    var id = button_id.split("_")[1];
    $("#vendor_id").val(id);
    $("#vendor_form").submit();
    event.preventDefault();
  });

  $("#logo").click(function() {
    window.location.replace('/');
  }).mouseover(function() {
    $("#logo").css('cursor', 'pointer');
  });

  //$("#new_gift_button").click(function(event) {
  //  form = $('#new_gift_button').closest("form");
  //  window.location.replace(form[0].action);
  //  event.preventDefault();
  //});

//submit payment to Stripe
  $("#payment-form").submit(function(event) {
    // disable the submit button to prevent repeated clicks
   $('#pay-button').attr("disabled", "disabled");

    var amount = 599; //amount you want to charge in cents
    Stripe.createToken({
        number: $('#card_number').val(),
        cvc: $('#card_code').val(),
        exp_month: $('#card_month').val(),
        exp_year: $('#card_year').val()
    }, amount, stripeResponseHandler);

    // prevent the form from submitting with the default action
    return false;
  });
})



