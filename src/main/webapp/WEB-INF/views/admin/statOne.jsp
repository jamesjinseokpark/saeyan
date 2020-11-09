<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="/resources/css/date_min.css" rel="stylesheet" type="text/css">
<script src="/resources/js/date_min.js"></script>
<!-- Include English language -->
<script src="/resources/js/date_en.js"></script>
</head>
<body>
기간 설정 : <input type="text" data-range="true" data-multiple-dates-separator=" ~ " data-language="en" class="datepicker-here" id='period'/>
<button id='btn'>그리기</button>	
	<div id="chart_div1" style="width: 500px; height: 500px;"></div>
	<div id="chart_div2" style="width: 500px; height: 500px;"></div>
<script>
var periodStart = "";
var periodEnd ="";
$('#btn').click(function(){
	var period = $('#period').val();
	var i = period.indexOf('~');
	periodStart = period.substr(0,i-1);
	periodEnd = period.substr(i+2);
	console.log(periodStart);
	console.log(periodEnd);
	chart();
});

// -------------------------------차트 그리는 시작--------------------------------------------
function chart(){	
 	google.charts.load('current', {'packages':['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawStuff);
	
      function drawStuff() {

        var chartDiv = document.getElementById('chart_div1');

		var jsonData = $.ajax({
			url: "/admin/rest/chartData",
			dataType:"json",
			data:{
				snum : ${snum},
				pStart : periodStart,
				pEnd : periodEnd 
			},
			async: false
			}).responseText;

		var data = new google.visualization.DataTable(jsonData);
		console.log(data);
        var materialOptions = {
          width: 900,
          chart: {
            title: '일일 판매 통계',
            subtitle: '일일 판매량과 판매금액'
          },
          series: {
            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
          },
          axes: {
            y: {
              distance: {label: '판매금액' ,range: {max:100000}}, // Left y-axis.
              brightness: {side: 'right', label: '판매량',range: {max:20}} // Right y-axis.
            }
          },
          bar: { groupWidth: "90%" },
          vAxis: { format:''}           
        };

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
        }
        drawMaterialChart();
    }
}
 // -------------------------------차트 그리는 부분 끝--------------------------------------------

 
</script>	
</body>

</html>