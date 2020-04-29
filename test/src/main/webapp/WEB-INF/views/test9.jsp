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
<table class="table table-striped" style="margin-top: 0;">
	<thead>
		<tr>
			<th>번호</th>
			<th>내용</th>
			<th>파일명</th>
		</tr>
	</thead>
	
	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="8">등록된 글이 없습니다.</td>		
			</c:when>
			
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.num}</td>
						<td>${dto.content}</td>
						<td>${dto.filename}</td>
						<td>
							<c:choose>
								<c:when test="${empty dto.filename}">파일 없음</c:when>
								<c:otherwise>
									<a href="javascript:downFile('${dto.filename}')">${dto.filename}</a>				
								</c:otherwise>
							</c:choose>
						</td>
				
						<td><a href="javascript:update('${dto.num}')">수정</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</tbody>
</table>
		
</div> <!-- container end -->


</body>
</html>