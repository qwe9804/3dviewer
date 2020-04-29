<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>bbs</title>
<meta charset="utf-8">
</head>
<body>
	<div class="container">
		<h1>조회</h1>
		<div class="panel panel-default">
			<div class="panel-heading">번호 : ${dto.num }</div>
			
			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.content }</div>
			
			<div class="panel-heading">파일이름 : ${dto.filename }</div>
		</div>

		
</div> <!-- container end -->


</body>
</html>