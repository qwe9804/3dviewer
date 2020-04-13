<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root }/resources/logincss/lpoint.css"/>

<title>Insert title here</title>
<script type="text/javascript">
function findid(){
	var url = "findid";
	wr = window.open(url,"id찾기","width=500,height=300");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
	
}
function findpw(){
	var url = "findpw";
	wr = window.open(url,"비밀번호 찾기","width=500,height=300");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
	
}

</script>

</head>
<body>
<div class="wrapper" style="background-image: url('${root}/image/login.jpg'); background-repeat:no-repeat; background-size:cover;">
 <form name="frm" method="post" action="login"> 
    <!--  신SSO 컬럼추가  END  -->
    <div id="content" class="login_content" role="main" style="height:800px; " >
        <div class="inner">
            <div class="login_form">
         	<div id="mast-head">
		<div class="container">
			<h1 class="title" id="mastHeadTitle">로그인</h1>
		</div>
		</div>
       
          <div class="inp_txt_wrap">
          <c:choose>   
          <c:when test="${c_id_val=='Y'}">           
              <input value="${c_id_val}"   type="text" name="m_id" id="loginid" class="inp_txt" title="아이디 직접 입력">
              </c:when>
              <c:otherwise>             
              <input placeholder="아이디"   type="text" name="m_id" id="loginid" class="inp_txt" title="아이디 직접 입력">          
              </c:otherwise>
              </c:choose>
          </div>
          <div class="inp_txt_wrap">
              <input placeholder="비밀번호" type="password" name="m_passwd" id="pswd" class="inp_txt" title="비밀번호 직접 입력" >
          </div>              

          <ul class="bar_lst">
    	<li>
  			<c:choose>
  				<c:when test="${c_id_val == 'Y' }">
  					<input style="-webkit-appearance:checkbox;"type='checkbox' name="c_id" value='Y' checked='checked'>아이디저장
  				</c:when>
  				<c:otherwise>
  					<input style="-webkit-appearance:checkbox;" type='checkbox' name='c_id' value="Y">아이디저장
  				</c:otherwise>
  			</c:choose>
  		</li>
          <li><a  onclick="findid()" target="_blank" title="새창열림">회원가입</a></li>
          <li><a  onclick="findid()" target="_blank" title="새창열림">아이디찾기</a></li>
          <li><a  onclick="findpw()" target="_blank" title="새창열림">비밀번호찾기</a></li>
          </ul>
          <div style="padding-top: 10px;">
          <button type="submit" class="ui-button __square-large __blue">로그인</button>
          </div>
            </div>            
        </div>       
    </div>     
</form>
    </div>
</body>
</html>