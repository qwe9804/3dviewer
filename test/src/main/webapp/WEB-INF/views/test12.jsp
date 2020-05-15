<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- saved from url=(0038)http://dermamirror.co.kr/analytics.jsp -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DermaMirror</title>
    
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="description" content="당신의 피부를 생각하는 더마미러">
    <meta name="keywords" content="더마미러">
    <link rel="stylesheet" href="${root}/DermaMirror_files/mobile_style.css">
    <link rel="stylesheet" href="${root}/DermaMirror_files/jquery-ui.css">
    
    <script src="${root}/DermaMirror_files/front.lib.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/ajax.common.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.bpopup.min.js.다운로드"></script>
    
    <link rel="stylesheet" href="${root}/DermaMirror_files/style.css">
    <link rel="stylesheet" href="${root}/DermaMirror_files/grid.css">
</head>
<body style="">
<section id="subcon">
	<div class="conWrap center">
    	<a href="http://dermamirror.co.kr/main.jsp" class="btn_back">
		<img src="${root}/DermaMirror_files/btn-prev.png" width="12" alt=""></a>
  		<h4 class="sub-title white-text">분석결과</h4>
		<a href="http://dermamirror.co.kr/analytics.jsp#" class="btn_next _popupOpen" data-id="popupMenuOption">
		<img src="${root}/DermaMirror_files/btn-menu.png" width="12" alt=""></a>
	</div>
<div class="popup_wrap transparent" id="popupMenuOption" style="display: none;">
	<a href="http://dermamirror.co.kr/analytics.jsp#" class="btn-close _popupClose"></a>
        <div class="popup_menu">
			<div class="row row-bb-dash"><a href="http://dermamirror.co.kr/analytics.jsp">분석결과</a></div>
			<div class="row row-bb-dash"><a href="http://dermamirror.co.kr/faq.jsp">FAQ</a></div>
			<div class="row "><a href="http://dermamirror.co.kr/mypage.jsp">MY PROFILE</a></div>
		</div>
</div>
	<div class="conWrap member analytics">
        <ul>
            <li class="center">중앙의 스크롤바를 이동시키면 이전 상태와<br>
            현재상태를 비교, 확인하실 수 있습니다.</li>
        </ul>
        <ul>
            <li class="space20"></li>
        </ul>
        <ul>
        <li class="left center"></li>
            <li>	<iframe src="http://192.168.0.107:8000/test/test3" width="480px" height="190px" frameborder="0" scrolling="no"></iframe>
            </li>
           <li class="right center"></li>
        </ul>
	</div>
	<div class="top-15">
        <div class="round-title">최근 0회 비교결과</div>
	</div>
	<div class="top-35">
        <div class="conWrap white-box">
            <ul>
                <li class="center"><a href="http://dermamirror.co.kr/analytics.jsp" class="btn_filter active center">색소변화</a>
                    <a href="http://dermamirror.co.kr/analytics02.jsp" class="btn_filter center">주름변화</a>
                    <a href="http://dermamirror.co.kr/analytics03.jsp" class="btn_filter center">모공변화</a>
                    <a href="http://dermamirror.co.kr/analytics04.jsp" class="btn_filter center">전체비교</a>
                </li>
            </ul>
            <ul>
                <li class="range-wrapper"><input onchange="setImage(this)" type="range" min="0" max="-1" value="0" step="1" style="margin-left:8%;width:86%" id="terms">
                <a href="http://dermamirror.co.kr/analytics.jsp#" class="btn_orange_small center" id="term-ouput"></a></li>
            </ul>
            <ul>
                <li>
                       <div class="col-lg-12" style="width:100%">
                            <div class="card">
                                <div class="card-body">
                                    <div class="flot-container">
                                        <div id="chart1" style="width: 100%; height: 275px; padding: 0px; position: relative;">
<!--                                       
                                        	<canvas class="flot-base" width="48" height="275" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 48px; height: 275px;"></canvas>
                                        	<div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: small; color: rgb(84, 84, 84);">
                                        		<div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; max-width: 16px; top: 257px; left: 28px; text-align: center;">12/08</div>
                                        		</div>
                                        		<div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 243px; left: 0px; text-align: right;">6320</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 213px; left: 0px; text-align: right;">6330</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 182px; left: 0px; text-align: right;">6340</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 152px; left: 0px; text-align: right;">6350</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 122px; left: 0px; text-align: right;">6360</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 91px; left: 0px; text-align: right;">6370</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 61px; left: 0px; text-align: right;">6380</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 30px; left: 0px; text-align: right;">6390</div>
                                        			<div class="flot-tick-label tickLabel" style="position: absolute; top: 0px; left: 0px; text-align: right;">6400</div>
                                        		</div>
                                        	</div>
                                        	<canvas class="flot-overlay" width="48" height="275" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 48px; height: 275px;"></canvas>
-->                                        	
                                        <canvas class="flot-base" width="420" height="275" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 420px; height: 275px;"></canvas><div class="flot-text" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);"><div class="flot-x-axis flot-x1-axis xAxis x1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"></div><div class="flot-y-axis flot-y1-axis yAxis y1Axis" style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;"><div class="flot-tick-label tickLabel" style="position: absolute; top: 251px; left: 0px; text-align: right;">-1.0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 188px; left: 0px; text-align: right;">-0.5</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 126px; left: 4px; text-align: right;">0.0</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 64px; left: 4px; text-align: right;">0.5</div><div class="flot-tick-label tickLabel" style="position: absolute; top: 2px; left: 4px; text-align: right;">1.0</div></div></div><canvas class="flot-overlay" width="420" height="275" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 420px; height: 275px;"></canvas><div class="legend"><div style="position: absolute; width: 102px; height: 53px; top: 13px; right: 20px; background-color: rgb(255, 255, 255); opacity: 0.85;"> </div><table style="position:absolute;top:13px;right:20px;;font-size:small;color:#000"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #8fc9fb;overflow:hidden"></div></div></td><td class="legendLabel">멜라닌</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #DC3545;overflow:hidden"></div></div></td><td class="legendLabel">헤모글로빈</td></tr></tbody></table></div></div>
                                    </div>
                                </div>
                            </div><!-- /# card -->
                        </div>
                </li>
            </ul>
        </div>



        <div class="banner">
            
            <ul class="center">
                <!--  <li><a href="#" class="center"><img src="images/pic_banner.jpg" width="100%" alt=""/></a></li> -->
                <li><a href="http://dermamirror.co.kr/analytics.jsp#" class="center"><img src="${root}/DermaMirror_files/saved_resource" width="100%" alt=""></a></li>
            </ul>
   
        </div>		
	</div>
</section>
  <script src="${root}/DermaMirror_files/front.common.js.다운로드"></script>
  <script src="${root}/DermaMirror_files/simplebar.js.다운로드"></script>

    <script src="${root}/DermaMirror_files/jquery-2.1.4.min.js.다운로드"></script>

    <script src="${root}/DermaMirror_files/plugins.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/main.js.다운로드"></script>
    
    <!--  flot-chart js -->
    <script src="${root}/DermaMirror_files/excanvas.min.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.pie.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.time.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.stack.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.resize.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.crosshair.js.다운로드"></script>
    <script src="${root}/DermaMirror_files/jquery.flot.tooltip.min.js.다운로드"></script>
    <!-- script src="assets/js/lib/flot-chart/flot-chart-init.js"></script -->
    <script type="text/javascript">
     
    
    (function($){
    	 var SufeeAdmin = {
    	    line2Flot: function(){
    	        var chart1Options = {
    	            series: {
    	                lines: { show: true
    	                },
    	                points: { show: true
    	                }
    	            },
    	            xaxis: {
    	                mode: "time",
    	                timezone:"browser",
    	                timeBase: "milliseconds",
    	                //autoscaleMargin: 1,
    	                timeformat: "%m/%d",
    					tickSize: [ 14, "day" ],
    	                minTickSize: [ 1, "day" ]
    	            },
    	            grid: {
    	                hoverable: true
    	            },
    	            legend: {
    	                show: true
    	            },
    	            grid: {
    	                color: "#000",
    	                hoverable: true,
    	                borderWidth: 0,
    	                backgroundColor: 'transparent'
    	            },
    	            tooltip: {
    	                show: true,
    	                //content: "y: %y"
    	                content: "%x <br>%s: %y"
    	            }
    	        };
    	        var chart1Data = {
    	            label: "멜라닌",
    	            color: "#8fc9fb",
    	            data: []
    	        };
    	        var chart2Data = {
    	            label: "헤모글로빈",
    	            color: "#DC3545",
    	            data: []
    	        };
    	        var chart3Data = {
   	                label: "주름",
   	                color: "#DC6832",
   	                data: []
   	            };
   	            var chart4Data = {
   	                label: "모공",
   	                color: "#3268DC",
   	                data: []
   	            };
    	        $.plot( $("#chart1" ), [ chart1Data,  chart2Data ], chart1Options);
    	    }
    	};

    	$(document).ready(function() {
    	    SufeeAdmin.line2Flot();

    	});
   	})(jQuery);

    //var img_array = ['images/pic_analytics01_01.png', 'images/pic_analytics01_02.png', 'images/pic_analytics01_03.png', 'images/pic_analytics01_04.png', 'images/pic_analytics01_05.png', 'images/pic_analytics01_06.png'];
    //var day_array = ['08.15', '08.29', '09.12', '09.26', '10.10', '10.24'];
       
        var img_array = [];
        var day_array = [];
		var counter = 150;
		
		function setImage(obj)
		{
			var img = document.getElementById('img1');
			var day = document.getElementById('myday');
			var term = document.getElementById('term-ouput');
			var value = obj.value;
			img1.style.backgroundImage = "url(" + img_array[value] + ")";
			day.innerHTML = day_array[value];
			term.innerHTML = day_array[value];
		}
		
		function createImageSwitcher(elementID,btnID) {

		  var element = document.getElementById(elementID);
		  var btn = document.getElementById(btnID);

		  function nextPic() {
			counter += 50;
			if (counter > 300) {
			  counter = 300; // stop at last image  
			}
			element.style.backgroundSize =  counter + "%";
			element.style.backgroundPositionX =  -80  + "px";
		  }

		  btn.addEventListener('click', nextPic);
				  // Load the first image
				  counter -= 50;
				  nextPic();

		}
		
		function removeImageSwitcher(elementID,btnID) {
		  var element = document.getElementById(elementID);
		  var btn = document.getElementById(btnID);

		  function prevPic() {
			counter -= 50;
			if (counter < 100) {
			  counter = 100; // stop at first image
			}
			element.style.backgroundSize =  counter + "%";
			element.style.backgroundPositionX =  0  + "px";
		  }

		  btn.addEventListener('click', prevPic);
				  // Load the last image
				  counter += 50;
				  prevPic();
			
		}
		
//		createImageSwitcher('img1','zoom1');
    </script>

<div class="flotTip" style="display: none; position: absolute; background: rgb(255, 255, 255); z-index: 1040; padding: 0.4em 0.6em; border-radius: 0.5em; font-size: 0.8em; border: 1px solid rgb(17, 17, 17); white-space: nowrap;"></div></body></html>