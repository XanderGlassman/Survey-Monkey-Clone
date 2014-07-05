$(document).ready(function() {
  $("#create_survey").on("submit" , function(event){
    event.preventDefault();
    $.ajax({
      url: "/surveys/create_title",
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(result){
        console.log(result);
        $("#survey_header").prepend("<h3>" + result.survey + "</h3><h4>" + result.question_body + "</h4>")
        $("#create_survey").hide();

        // $("ul").append("<li>" + result.choice_body + "</li>");
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
});
