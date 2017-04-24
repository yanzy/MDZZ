// $.rails.allowAction = function(element){
//   var message = element.data("confirm");
//   if (!message) { return true; }
//
//   $(".confirm-message").html(message)
//   $("#confirm_message").show();
//   setTimeout(function(){
//     $("#confirm_message").children(".confirm-div").addClass("mask-show");
//   }, 10);
//   $("#confirm_ok").click(function(){
//     element.data("confirm", null);
//     element.trigger("click.rails");
//     element.data("confirm", message);
//     $("#confirm_message").hide();
//   });
//   return false;
// }
//
// document.addEventListener("turbolinks:load", function() {
//   $("#confirm_close").click(function(){
//     $("#confirm_message").hide();
//   });
// });
