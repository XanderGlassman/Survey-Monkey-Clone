
// google.load('visualization', '1.0', {'packages':['corechart']});
// google.setOnLoadCallback(drawChart);

// $(document).ready(function() {
//   var survey_id = $("#survey_id_input").val()
//   $.ajax({
//   url: "/surveys/stats",
//   type: "POST",
//   dataType: "json",
//   success: function(result){
//     console.log(result.survey_name);
//     window.survey_name = result.survey_name
//     }
//   });
// });




// function drawChart() {

//   // Create the data table.
//   var data = new google.visualization.DataTable();
//   data.addColumn('string', 'Topping');
//   data.addColumn('number', 'Slices');
//   data.addRows([
//     ['Mushrooms', 3],
//     ['Onions', 1],
//     ['Olives', 1],
//     ['Zucchini', 1],
//     ['Pepperoni', 2]
//   ]);

//   // Set chart options
//   var options = {'title': survey_name,
//                  'width':800,
//                  'height':600};

//   // Instantiate and draw our chart, passing in some options.
//   var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
//   chart.draw(data, options);
// }




