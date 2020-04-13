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
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							//  document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							// document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<script type="text/javascript">
function emailcheck(email){
	if(email==''){
		alert("이메일을 입력하세요.");
		document.frm.m_email.focus();
	}else{
		var url="emailcheck";
		var param = "email=" + email;
		
		$.get(url,param, function(data, textStatus) {
			$("#emailcheck").text(data);
			
		})			
	}
}	
</script>
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
		<form action="updatemypage" class="form-horizontal" method="post"
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
									<label for="user-office-0">휴대폰 번호</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __phone">

										<div class="ui-input">
											<input type="tel" id="cellphoneNo2" name="m_phone1"
												value="${dto.m_phone1 }" maxlength="3" title="전화번호 가운데 자리"> 
										</div>
										<div class="ui-input">
											<input type="tel" id="cellphoneNo2" name="m_phone2"
												value="${dto.m_phone2}" maxlength="4" title="전화번호 가운데 자리"> 
										</div>
										<div class="ui-input">
											<input type="tel" id="cellphoneNo3" name="m_phone3"
												value="${dto.m_phone3}" maxlength="4" title="전화번호 뒷자리">
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
										<button type="button" id="btnAddSrch"
												class="ui-button __square-small __black"
												onclick="sample6_execDaumPostcode()">우편번호</button>
											<div class="ui-input" style="margin:0;">
												<input type="text" value="05484" id="sample6_postcode"
													title="우편번호" name="m_addr1" readonly="readonly"
													maxlength="6"  >
											</div>
										</div>
										<div class="inner">
											<div class="ui-input">
												<input type="text" value="서울시 용산구" id="sample6_address"
													name="m_addr2" readonly="readonly" title="상세주소 1"
													placeholder="상세주소1">
											</div>
										</div>
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="sample6_detailAddress"
													name="m_addr3" value="코아빌딩" 
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
										<select name="m_birth1" id="year" title="년도"
											class="ui-select">
											<option  selected="selected">${dto.m_birth1 }</option>

																						
											<option value="2019">2019</option>

											<option value="2018">2018</option>

											<option value="2017">2017</option>

											<option value="2016">2016</option>

											<option value="2015">2015</option>

											<option value="2014">2014</option>

											<option value="2013">2013</option>

											<option value="2012">2012</option>

											<option value="2011">2011</option>

											<option value="2010">2010</option>

											<option value="2009">2009</option>

											<option value="2008">2008</option>

											<option value="2007">2007</option>

											<option value="2006">2006</option>

											<option value="2005">2005</option>

											<option value="2004">2004</option>

											<option value="2003">2003</option>

											<option value="2002">2002</option>

											<option value="2001">2001</option>

											<option value="2000">2000</option>

											<option value="1999">1999</option>

											<option value="1998">1998</option>

											<option value="1997">1997</option>

											<option value="1996">1996</option>

											<option value="1995">1995</option>

											<option value="1994">1994</option>

											<option value="1993">1993</option>

											<option value="1992">1992</option>

											<option value="1991">1991</option>

											<option value="1990">1990</option>

											<option value="1989">1989</option>

											<option value="1988">1988</option>

											<option value="1987">1987</option>

											<option value="1986">1986</option>

											<option value="1985">1985</option>

											<option value="1984">1984</option>

											<option value="1983">1983</option>

											<option value="1982">1982</option>

											<option value="1981">1981</option>

											<option value="1980">1980</option>

											<option value="1979">1979</option>

											<option value="1978">1978</option>

											<option value="1977">1977</option>

											<option value="1976">1976</option>

											<option value="1975">1975</option>

											<option value="1974">1974</option>

											<option value="1973">1973</option>

											<option value="1972">1972</option>

											<option value="1971">1971</option>

											<option value="1970">1970</option>

											<option value="1969">1969</option>

											<option value="1968">1968</option>

											<option value="1967">1967</option>

											<option value="1966">1966</option>

											<option value="1965">1965</option>

											<option value="1964">1964</option>

											<option value="1963">1963</option>

											<option value="1962">1962</option>

											<option value="1961">1961</option>

											<option value="1960">1960</option>

											<option value="1959">1959</option>

											<option value="1958">1958</option>

											<option value="1957">1957</option>

											<option value="1956">1956</option>

											<option value="1955">1955</option>

											<option value="1954">1954</option>

											<option value="1953">1953</option>

											<option value="1952">1952</option>

											<option value="1951">1951</option>

											<option value="1950">1950</option>

											<option value="1949">1949</option>

											<option value="1948">1948</option>

											<option value="1947">1947</option>

											<option value="1946">1946</option>

											<option value="1945">1945</option>

											<option value="1944">1944</option>

											<option value="1943">1943</option>

											<option value="1942">1942</option>

											<option value="1941">1941</option>

											<option value="1940">1940</option>

											<option value="1939">1939</option>

											<option value="1938">1938</option>

											<option value="1937">1937</option>

											<option value="1936">1936</option>

											<option value="1935">1935</option>

											<option value="1934">1934</option>

											<option value="1933">1933</option>

											<option value="1932">1932</option>

											<option value="1931">1931</option>

											<option value="1930">1930</option>

											<option value="1929">1929</option>

											<option value="1928">1928</option>

											<option value="1927">1927</option>

											<option value="1926">1926</option>

											<option value="1925">1925</option>

											<option value="1924">1924</option>

											<option value="1923">1923</option>

											<option value="1922">1922</option>

											<option value="1921">1921</option>

											<option value="1920">1920</option>

										</select> <select name="m_birth2" id="month" title="월"
											class="ui-select">
											<option  selected="selected">${dto.m_birth2 }</option>
											
			

											<option value="01">01</option>

											<option value="02">02</option>

											<option value="03">03</option>

											<option value="04">04</option>

											<option value="05">05</option>

											<option value="06">06</option>

											<option value="07">07</option>

											<option value="08">08</option>

											<option value="09">09</option>

											<option value="10">10</option>

											<option value="11">11</option>

											<option value="12">12</option>

										</select> <select name="m_birth3" id="day" title="일" class="ui-select">
											<option  selected="selected">${dto.m_birth3 }</option>
											
											
											
											<option value="01">01</option>

											<option value="02">02</option>

											<option value="03">03</option>

											<option value="04">04</option>

											<option value="05">05</option>

											<option value="06">06</option>

											<option value="07">07</option>

											<option value="08">08</option>

											<option value="09">09</option>

											<option value="10">10</option>

											<option value="11">11</option>

											<option value="12">12</option>

											<option value="13">13</option>

											<option value="14">14</option>

											<option value="15">15</option>

											<option value="16">16</option>

											<option value="17">17</option>

											<option value="18">18</option>

											<option value="19">19</option>

											<option value="20">20</option>

											<option value="21">21</option>

											<option value="22">22</option>

											<option value="23">23</option>

											<option value="24">24</option>

											<option value="25">25</option>

											<option value="26">26</option>

											<option value="27">27</option>

											<option value="28">28</option>

											<option value="29">29</option>

											<option value="30">30</option>

											<option value="31">31</option>

										</select>
									</div>
								</div>
							</div>

							
							<!-- </div> -->
						</div>
						<button type="button" class="ui-button __square-large __black"
						onclick="history.back()">뒤로가기</button>
						<button type="submit" class="ui-button __square-large __blue"
						>수정하기</button>
				
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>