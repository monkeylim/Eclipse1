<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
function check(){
	document.form1.action="${path}/project_servlet/insert.do";
	document.form1.submit();
}
</script>
</head>
<body>
<h2>회원가입</h2>
<form method ="post">
<tr>아이디<span>*</span></tr>
<input name="id" placeholder="필수항목입니다."><br>
<tr>비밀번호<span>*</span></tr>
<input type="password" name="passwd" placeholder="필수항목입니다."><br>
<tr>비밀번호 확인<span>*</span></tr>
<input type="password" name="passwd" placeholder="필수항목입니다."><br>
<tr>이메일<span>*</span></tr>
<input type="email" name="email" placeholder="형식에 맞게 입력해주세요."><br>
<tr>이름<span>*</span></tr>
<input name="name" placeholder="필수항목입니다."><br>
<input type ="submit" name="check" value="가입하기" onclick="check()">
</form>
</body>
</html>