$(function() {
  $("#tasks").on("click", ".task-content", function() {
    var text = $(this).text().trim();
    var task_id = $(this).data("task");
    var input = $("<input type='text' id='new_title' name='task[title]'>");
    input.val(text);
    var form = $("<form id='edit_task' data-task='" + task_id + "'>");
    form.append(input);
    $(this).after(form);
    $(this).hide();
  });

  $("#tasks").on("submit", "#edit_task", function() {
    var task_id = $(this).data("task");
    $.ajax(
      "/tasks/" + task_id,
      {
        type: "PATCH",
        data: $(this).serialize(),
        dataType: "json",
        success: function(data) {
          var text = data.title;
          $("#" + task_id).text(text).show();
          $("#edit_task").remove();
        }
      }
    );
    return false;
  });
});
