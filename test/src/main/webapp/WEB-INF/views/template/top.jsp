<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="top">
		<div class="wrap_top">
			<div class="top_main">
				<ul class="top_ul1">
					<li><a href="#">홈</a></li>
					<li><a href="#">도서</a></li>
					<li><a href="#">티켓</a></li>
					<li><a href="#">투어</a></li>
					<li><a href="#">아이마켓</a></li>
				</ul>

				<ul class="top_ul2">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
					<li><a href="login">로그인</a></li>
					<li><a href="create">회원가입</a></li>
					</c:when>
					<c:otherwise>					
					<li><a href="${root }/logout">로그아웃</a></li>
					<li><a href="${root }/mypage?id=${sessionScope.id}">마이페이지</a></li>
					<li><a href="#">거래내역</a></li>
					</c:otherwise>
				</c:choose>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>