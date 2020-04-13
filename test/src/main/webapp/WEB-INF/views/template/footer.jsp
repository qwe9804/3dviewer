<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="footer">
		<div class="wrap_footer">
			<div class="footer_text">
				<div class="ftext_1">
					<h1>새마을식당 <span class="don">돈가스</span></h1>
				</div>
				<div class="ftext_2">
					<h3>
						고객센터 <a href="#" class="link_mun">문의 전 클릭</a>
					</h3>
					<p>쇼핑 1588-1555 도서 1577-2555 티켓 1544-1555 투어 1588-3443 펫
						1644-2397 팩스 02-6924-9000 이메일 helpdesk@interpark.com 서울특별시 구로구
						디지털로31길 61 신세계아이앤씨디지털센터 2층</p>
				</div>
				<div class="ftext_2">
					<h3>전자금융거래분쟁처리담당</h3>
					<p>전화 1588-1555 도서 1577-2555 티켓 1544-1555 팩스 02-6924-9001 이메일
						intersolution@interpark.com 개인정보보호책임자 cpo@interpark.com</p>
				</div>
				<div class="ftext_2">
					<h3>서울보증보험 구매안전서비스</h3>
					<p>서울보증보험 구매안전서비스 고객님은 안전거래를 위해 현금으로 5만원이상 결제시 구매자가 보호를 받을 수 있는
						구매안전서비스(쇼핑몰보증보험)를 이용하실 수 있습니다.</p>
				</div>
			</div>
			<hr class="hr">
			<div class="footer_img">
				<ul class="footer_ul">
					<li class="footer_li"><img src="${root }/image/logo.jpg"></li>
					<li class="footer_li"><img src="${root }/image/logo.jpg"></li>
					<li class="footer_li"><img src="${root }/image/logo.jpg"></li>
					<li class="footer_li"><img src="${root }/image/logo.jpg"></li>
					<li class="footer_li"><img src="${root }/image/logo.jpg"></li>
					<li class="footer_li"><img src="${root }/image/logo.jpg"></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>