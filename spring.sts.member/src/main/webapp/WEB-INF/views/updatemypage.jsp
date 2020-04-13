<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${root }/resources/createcss/information.css" />
<link rel="stylesheet"
	href="${root }/resources/createcss/layout.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<!-- mast head start -->
		<div id="mast-head">
			<div class="container">

				<h1 class="title" id="mastHeadTitle">정보수정</h1>

			</div>
		</div>
		<!-- mast head end -->
		<form action="createproc" class="form-horizontal" method="post"
			name='frm' onsubmit="return inCheck(this)">
			<div id="mast-body">

				<div id="infoDiv" style="">
					<div class="container">
						<div class="section __half __zero __wide">
							<h3 class="subject __underline">
								<em>정보수정</em>
							</h3>


							<div class="row">
								<div class="col-md">
									<label for="m_email">이메일 주소</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="m_email" name="m_email" value="${dto.m_email }"
													title="이메일주소"> 
											</div>
										</div>

									</div>
								</div>

							</div>


							<div id="divOnlId" class="row">
								<div class="col-md">
									<label for="m_id">아이디</label>

								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="ui-input">
											<input type="text" id="m_id" name="m_id" title="아이디" readonly="readonly"
											value="${dto.m_id }">
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md">
									<label for="name">이름</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="name" name="name" title="이름" readonly="readonly"
												value="${dto.m_name }">
											</div>
										</div>
									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-md">
									<label for="user-office-0">휴대폰 번호</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __phone">

										<div class="ui-input">
											<input type="tel" id="cellphoneNo2" name="cellphoneNo2"
												value="${dto.m_phone1 }" title="전화번호 가운데 자리"> 
										</div>
										<div class="ui-input">
											<input type="tel" id="cellphoneNo2" name="cellphoneNo2"
												value="${dto.m_phone2}"  title="전화번호 가운데 자리"> 
										</div>
										<div class="ui-input">
											<input type="tel" id="cellphoneNo3" name="cellphoneNo3"
												value="${dto.m_phone3}" title="전화번호 뒷자리">
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-md">
									<label for="home">주소</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __post">
										<div class="inner postcode">
											<div class="ui-input" style="margin:0;">
												<input type="text" value="05484" id="sample6_postcode"
													title="우편번호" name="sample6_postcode" readonly="readonly"
													maxlength="6"  >
											</div>
										</div>
										<div class="inner">
											<div class="ui-input">
												<input type="text" value="서울시 용산구" id="sample6_address"
													name="sample6_address" readonly="readonly" title="상세주소 1"
													placeholder="상세주소1">
											</div>
										</div>
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="sample6_detailAddress"
													name="sample6_detailAddress" value="코아빌딩" readonly="readonly"
													title="상세주소 2" placeholder="상세주소2">
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md">
									<label for="year">생년월일</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __date">
										<div class="ui-input">
											<input type="text" class="year"id="birthday1" name="m_birth" value="1000년"
												maxlength="4" title="생년" readonly="readonly">
										</div>
										
										<div class="ui-input">
											<input type="text" class="month"id="birthday2" name="m_birth" value="10월"
												maxlength="4" title="생월" readonly="readonly">
										</div>														
										<div class="ui-input">
											<input type="text" class="day" id="birthday3" name="m_birth" value="4일"
												maxlength="4" title="생일" readonly="readonly">
										</div>										
									</div>
								</div>
							</div>

							
							<!-- </div> -->
						</div>
						<button type="button" class="ui-button __square-large __blue"
						onclick="history.back()">정보수정</button>
						<button type="button" class="ui-button __square-large __blue"
						onclick="history.back()">비밀번호 수정</button>
						<button type="button" class="ui-button __square-large __black"
						onclick="history.back()">거래내역</button>
						<button type="button" class="ui-button __square-large __black"
						onclick="history.back()">즐겨찾기</button>

						
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>