/* 

  solution for firing up datepicker for dynamically generated date form fields: event delegation 
  https://learn.jquery.com/events/event-delegation/
  http://stackoverflow.com/questions/13636169/datepicker-wont-work-on-dynamically-generated-field

*/
$(function(){
  $("body").on("click", ".datepicker", function() {
    $(this).datepicker({dateFormat: "yy-mm-dd"}).triggerHandler("focus");
  });
});

/* Activating Best In Place */
$(document).ready(function() {
  $(".best_in_place").best_in_place();
});

/* add task field */
$(document).ready(function() {
  $("form").on("click", ".add_fields", function(){
    var time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.add_a_line_row').before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
});

/* delete a task */
function remove_task(link){
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".task_row").hide();
}

$(document).ready(function() {
  setTimeout(function(){
    $(".alert").fadeOut(500);
  }, 4000);
});