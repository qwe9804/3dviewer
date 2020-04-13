<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root }/resources/logincss/lpoint.css"/>
<link rel="stylesheet" href="${root }/resources/logincss/layout.css"/>
<title>Insert title here</title>
<script type="text/javascript">
function use(){
	opener.frm.id.value = '${id}';
	self.close();
}
</script>
</head>
<body>
		<div id="infoDiv" style="">
				<div class="container">
					<div class="section __half __zero __wide">
						<h3 class="subject __underline">
							<em>아이디 찾기</em>
						</h3>
						<c:choose>
						<c:when test="${not empty id}">
						<div class="container">
							<h1 class="description">1. ${id}님의 password : ${passwd} </h1><br>
							<h1 class="description">2. 바로 사용하시려면 사용 버튼을 눌러주세요.</h1><br>
						<button type="button" class="ui-button __square-normal __blue"
						onclick="use()">사용</button>
						<button type="submit" class="ui-button __square-normal __black"
						onclick="self.close()">닫기</button>							
						</div>
						</c:when>
						<c:otherwise>
						<div class="container">
							<h1 class="description">1. ${id}님의 password : 비밀번호를 찾을수 없습니다. </h1><br>
							<h1 class="description">2. 정보를 올바르게 입력한후 다시 시도 해 주세요.</h1><br>
							<h1 class="description">3. 아직 회원이 아니시라면 회원가입을 통해 서비스를 이용하세요.</h1><br>
							<h1 class="description">4. 서버 오류일 수 있으니 고객센터의 문의해 주세요.</h1><br>
						<button type="button" class="ui-button __square-normal __blue"
						onclick="history.back()">아이디찾기</button>
						<button type="submit" class="ui-button __square-normal __black"
						onclick="self.close()">닫기</button>
					 	</div>						
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
</body>
</html>