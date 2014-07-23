$(function() {
  $("#tasks").on("click", ".task-content", function() {
    $(this).hide();
    var task_id = $(this).data("task");
    $("#edit_task_" + task_id).show();
    $("#edit_task_" + task_id).find("input").filter(":visible:first").focus();
  });

  //$("#tasks").on("focusout", ".edit_task", function(event) {
  //  $(this).submit();
  //});
});
