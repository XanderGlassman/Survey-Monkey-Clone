$(document).ready(function() {
    $("#create_survey").on("submit", function(event) {
        event.preventDefault();
        $.ajax({
            url: "/surveys/create_title",
            type: "POST",
            data: $(this).serialize(),
            dataType: "json",
            success: function(result) {
                console.log(result);
                $("#survey_header").prepend("<h3>" + result.survey + "</h3><h4>" + result.question_body + "</h4>")
                $("#create_survey").hide();
                $("#create_choice input[type = 'hidden']").val(result.question_id)
            }
        });
    });
    $("#create_choice").on("submit", function(event) {
        event.preventDefault();
        $.ajax({
            url: "/surveys/create",
            type: "POST",
            data: $(this).serialize(),
            dataType: "json",
            success: function(result) {
                console.log(result);
                $("ul").append("<li>" + result.choice_body + "</li>");
                $("#create_choice input[type = 'text']").val("")
            }
        });
    });

    $('#signup form').submit(function(event) {
        var email = this.email.value;
        var password = this.password.value;
        if (email.match(/^.+[@].+[.].+/) === null || password.match(/^(?=.{8,})[a-zA-Z0-9\s\-,]+.\*?$/) === null || password.match(/^(?=.*[A-Z]).+$/) === null || password.match(/^(?=.*\d).+$/) === null) {
            event.preventDefault();
            console.log("fail");
            $("li").remove();
        }
        if (email.match(/^.+[@].+[.].+/) === null) {
            $("#errors").append("<li>Must be a valid email</li>");
        }
        if (password.match(/^(?=.{8,})[a-zA-Z0-9\s\-,]+.\*?$/) === null) {
            $("#errors").append("<li>Password must contain 8 digits</li>");
        }
        if (password.match(/^(?=.*[A-Z]).+$/) === null) {
            $("#errors").append("<li>Password must contain at least one capital letter</li>");
        }
        if (password.match(/^(?=.*\d).+$/) === null) {
            $("#errors").append("<li>Password must contain one number</li>");
        }

    });
});