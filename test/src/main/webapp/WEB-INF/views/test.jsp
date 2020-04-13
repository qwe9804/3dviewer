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

<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">데이터보내기</h1>
		<form class="form-horizontal" action="test" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="fname">원본파일</label>
<!-- 				<div class="col-sm-6"> -->
<!-- 					<div> -->


<!-- 						<textarea style="width: 500px; height: 500px;" id="output" -->
<!-- 							name="output"></textarea> -->

<!-- 					</div> -->

<!-- 				</div> -->
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="filename">파일</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="filename"
						name="filename">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="fname">file</label>
				<div class="col-sm-6">
<!-- 					<button class="btn btn-default" type="button" -->
<!-- 						onclick="openTextFile()">파일선택</button> -->
					<button class="btn btn-default" type="submit">보내기</button>
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


	<script>
		function openTextFile() {
			var input = document.createElement("input");

			input.type = "file";
			input.accept = "text/plain"; // 확장자가 xxx, yyy 일때, ".xxx, .yyy"

			input.onchange = function(event) {
				processFile(event.target.files[0]);
			};

			input.click();
		}

		function processFile(file) {
			var reader = new FileReader();

			reader.onload = function() {

				output.innerText = reader.result;

			};

			reader.readAsText(file, /* optional */"euc-kr");

		}
		//if($("#output").val != null){
		//DModel();
		//}
	</script>


</body>
</html>