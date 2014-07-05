$(document).ready(function() {
  $("#create_choice").hide()
  $("#create_question").hide()
  $("#create_survey").on("submit" , function(event){
    event.preventDefault();
    $.ajax({
      url: "/surveys/create_title",
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(result){
        console.log(result);
        $("#survey_header").prepend("<h3>" + result.survey + "</h3>")
        $("#create_survey").hide();
        $("#create_question input[type = 'hidden']").val(result.survey_id)
        $("#create_question").show()
      }
    });
  });
    $("#create_choice").on("submit" , function(event){
    event.preventDefault();
    $.ajax({
      url: "/surveys/create",
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(result){
        console.log(result);
        $("ul").append("<li>" + result.choice_body + "</li>");
        $("#create_choice input[type = 'text']").val("")

      }
    });
  });
    $("#create_question").on("submit" , function(event){
    event.preventDefault();
    $.ajax({
      url: "/surveys/create_question",
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(result){
        console.log(result);
        $("ul").append("<li><h3>" + result.question_body + "</h3></li>");
        $("#create_choice input[type = 'hidden']").val(result.question_id)
        $("#create_question input[type = 'text']").val("")
        $("#create_choice").show()
      }
    });
  });
});
