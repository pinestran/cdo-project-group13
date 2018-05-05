var url_default;
var chart;
var dps;
dps = [];
url_default = 'http://127.0.0.1:8000/api/public/history/?currencyPair=:currency&period=:period&start=:start&end=:end';
chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2",
        exportEnabled: true,
        zoomEnabled: true,
        zoomType: "xy",
        title: {
            text: "",
        },
        subtitles: [{
            text: ""
        }],
        axisX: {
            valueFormatString: "HH:mm DD MMM",
            labelFontSize: 14,
            labelAngle: -45
        },
        axisY: {
            title: "Price (in USD)",
            includeZero: false,
            prefix: "$",
            labelFontSize: 14,
            titleFontSize: 20
        },
        data: [{
            type: "candlestick",
            color: "#223535",
            fallingColor: "red",
            risingColor: "green",
            xValueType: "dateTime",
            dataPoints: dps,
            fillOpacity:1
        }]
    });

$(function(){
	renderChart();

	function calcTime(url) {
		var dt = new Date();
        var secs = parseInt(dt.getTime()/1000);
        var start = secs - 3*86400;
        var end = secs;
        url = url.replace(':start',start);
        url = url.replace(':end',end);
        return url;
	}

	function renderChart() {
        var scandlesticks = $('#scandlesticks li .active').data('time');
        var market = $('#market .c-table1 tr.active').data('url');
        var url = url_default.replace(':currency',market);
        url = url.replace(':period',scandlesticks);
        url=calcTime(url);
        console.log(url);

        $.getJSON(url, parseData);
    }

    function parseData(result) {
	    dps = [];
        for (var i = 0; i < result.length; i++) {
            var y =[];
            y.push(result[i][3],result[i][1],result[i][2],result[i][4]);
            dps.push({
                x: result[i][0]*1000,
                y: y
            });
	    }
        console.log(result.length);

	    chart.options.data[0].dataPoints = dps;
        chart.render();
    }
    $('#scandlesticks li button').click(function(){
    	$('#scandlesticks li button').removeClass("active");
    	$(this).addClass("active");
    	renderChart();
    });
	$('#market .c-table1 tr').click(function(){
		$('#market .c-table1 tr').removeClass("active");
		$(this).addClass("active");

		renderChart();

		var small1 = $('.tab .tablinks.active').text();
		var small2 = $('.c-table1 tr.active td:first-child').text();
		$('.c-title2 small').html(small1+'/'+small2);
	});
});

function openCity(evt, cityName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
	var small1 = $('.tab .tablinks.active').text();
	var small2 = $('.c-table1 tr.active td:first-child').text();
	$('.c-title2 small').html(small1+'/'+small2);
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
