<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>index</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script> 
<script type="text/javascript">
$(function(){
    $('.spring').mouseover(function(){
        $('.spring').addClass('over');
        $('.summer').addClass('out');
        $('.fall').addClass('out');
        $('.winter').addClass('out');
    });
    
    $('.spring').mouseout(function(){
    	$('.spring').removeClass('over');
    	$('.summer').removeClass('out');
    	$('.fall').removeClass('out');
    	$('.winter').removeClass('out');
    })
    $('.summer').mouseover(function(){
        $('.summer').addClass('over');
        $('.spring').addClass('out');
        $('.fall').addClass('out');
        $('.winter').addClass('out');
    });
    $('.summer').mouseout(function(){
    	$('.summer').removeClass('over');
    	$('.spring').removeClass('out');
    	$('.fall').removeClass('out');
    	$('.winter').removeClass('out');
    });
    $('.fall').mouseover(function(){
        $('.fall').addClass('over');
        $('.spring').addClass('out');
        $('.summer').addClass('out');
        $('.winter').addClass('out');
    });
    $('.fall').mouseout(function(){
    	$('.fall').removeClass('over');
    	$('.spring').removeClass('out');
    	$('.summer').removeClass('out');
    	$('.winter').removeClass('out');
    });
    $('.winter').mouseover(function(){
        $('.winter').addClass('over');
        $('.spring').addClass('out');
        $('.summer').addClass('out');
        $('.fall').addClass('out');
    });
    $('.winter').mouseout(function(){
    	$('.winter').removeClass('over');
    	$('.spring').removeClass('out');
    	$('.summer').removeClass('out');
    	$('.fall').removeClass('out');
    });
    $('.winter').click(function(){
    	var url = "./order";
		location.href = url;
	});
});


</script>
<style type="text/css">
	html, body {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
	}
	.container{
		height: 100%;	
		width: 100%;
	}
	.wrapper{
		height: 100%;
		margin: 0 auto;
		text-align: center;
		display: flex;
	}
	.spring{
		display: inline-block;
		width: 25%;
		padding: 350px 0;
		background-image: url("image/spring.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		cursor:url(https://3.bp.blogspot.com/-RqwdqNsKyes/VuuIFvsO9VI/AAAAAAAABfA/DO9-9WvAh7csGaUKWZ5qTxAOb4gwNP0_Q/s1600/cursor.png), progress;
}
	.spring_h1{
		font-size: 30px;
		margin-bottom: 50px;
	}
	.spring_h1 a {
		text-decoration: none;
		color: #000;
	}
	.spring_h2{
		font-size: 20px;
	}
	.summer{
		display: inline-block;
		width: 25%;
		padding: 350px 0;
		background-image: url("image/summer.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		cursor:url(https://3.bp.blogspot.com/-RqwdqNsKyes/VuuIFvsO9VI/AAAAAAAABfA/DO9-9WvAh7csGaUKWZ5qTxAOb4gwNP0_Q/s1600/cursor.png), progress;
}
	.summer_h1{
		font-size: 30px;
		margin-bottom: 50px;
	}
	.summer_h1 a {
		text-decoration: none;
		color: #000;
	}
	.summer_h2{
		font-size: 20px;
	}
	
	.fall{
		display: inline-block;
		width: 25%;
		padding: 350px 0;
		background-image: url("image/fall.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		cursor:url(https://3.bp.blogspot.com/-RqwdqNsKyes/VuuIFvsO9VI/AAAAAAAABfA/DO9-9WvAh7csGaUKWZ5qTxAOb4gwNP0_Q/s1600/cursor.png), progress;
	}
	.fall_h1{
		font-size: 30px;
		margin-bottom: 50px;
	}
	.fall_h1 a {
		text-decoration: none;
		color: #000;
	}
	.fall_h2{
		font-size: 20px;
		margin-bottom: 50px;
	}
	.winter{
		display: inline-block;
		width: 25%;
		padding: 350px 0;
		background-image: url("image/winter.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		cursor:url(https://3.bp.blogspot.com/-RqwdqNsKyes/VuuIFvsO9VI/AAAAAAAABfA/DO9-9WvAh7csGaUKWZ5qTxAOb4gwNP0_Q/s1600/cursor.png), progress;
	}	
	.winter_h1{
		font-size: 30px;
		margin-bottom: 50px;
	}
	.winter_h1 a {
		text-decoration: none;
		color: #000;
	}
	.winter_h2{
		font-size: 20px;
	}
	.over{
		width: 30%;
		transition: width 0.3s;
		opacity: 1;
	}
	.out{
		opacity: 0.7;
	}
	
</style>

</head>
<body>
	<div class="container">
		<div class="wrapper">
			<div class="spring">
				<div class="spring_text">
					<h1 class="spring_h1">봄</h1>
				</div>
				
				<div class="spring_logo">
					<h2 class="spring_h2">바로가기</h2>
				</div>
			</div>
			<div class="summer">
				<div class="summer_text">
					<h1 class="summer_h1">여름</h1>
				</div>
				
				<div class="summer_logo">
					<h2 class="summer_h2">바로가기</h2>
				</div>
			
			</div>
			<div class="fall">
				<div class="fall_text">
					<h1 class="fall_h1">가을</h1>
				</div>
				
				<div class="fall_logo">
					<h2 class="fall_h2">바로가기</h2>
				</div>
			</div>
			<div class="winter" >
				<div class="winter_text">
					<h1 class="winter_h1">겨울</h1>
				</div>
				<div class="winter_logo">
					<h2 class="winter_h2">바로가기</h2>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
