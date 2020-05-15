<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%

	pageContext.setAttribute("replace", "\\n");
%>


<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>

<html>
<head>
<title></title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">SQL데이터보내기</h1>
		<form class="form-horizontal" action="test8" method="post"
			enctype="multipart/form-data">

			<div class="form-group">
				<label class="control-label col-sm-2" for="filename">파일</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="filename"
						name="filenameMF">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="content"
						name="content">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="fname">SQL</label>
				<div class="col-sm-6">
					<button class="btn btn-default" type="submit">등록하기</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="button" class="btn btn-default"
						onclick="history.back()">뒤로가기</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>