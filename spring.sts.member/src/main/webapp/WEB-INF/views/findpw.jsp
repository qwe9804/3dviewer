<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form name="form1"> 
   	<div id="mast-head">
		<div class="container">
			<h1 class="title" id="mastHeadTitle">비밀번호 찾기</h1>
		</div>
	</div>
    <div class="inp_txt_wrap">              
         <input placeholder="아이디"   type="text" name="m_id" id="m_id" class="inp_txt" title="아이디 직접 입력">
    </div>
    <div class="inp_txt_wrap">        
    	 <input placeholder="이메일" type="email" name="m_email" id="m_email" class="inp_txt" title="이메일 직접 입력" >
    </div>                   
    <div style="padding-top: 10px;">
         <button type="submit" class="ui-button __square-normal __blue">찾기</button>
    </div>
 </form>
</body>
</html>