// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function resize () {
  //chart.draw(data, options);
  drawChart();
  }
  if (window.addEventListener) {
      window.addEventListener('resize', resize);
  }
  else {
      window.attachEvent('onresize', resize);
  }

// Draw the chart and set the chart values
function drawChart() {
  var arr = [
      ['group_name', 'sum'],
    ];

var data  = document.getElementById('piechart').getAttribute("data");
js_array = JSON.parse(data)

  js_array.forEach((element, index, array) => {
      if (!element["group_name"] ) {
        element["group_name"] = "Uncategory";
      }
      arr.push([element["group_name"], element["sum"]]);

  });

  var data = google.visualization.arrayToDataTable(arr);

  // Optional; add a title and set the width and height of the chart
  var options = {
    'backgroundColor': 'transparent',
    'is3D':true
    };

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}


console.log('Hello from pie.js')