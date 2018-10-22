<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ROMANTIC</title>
<%@ include file="../include/header.jsp" %>
<script>
function loginCheck(){
   var userid = document.form2.userid.value;
   var userpasswd = document.form2.userpasswd.value;
   if(userid==""){
      alert("아이디를 입력하세요.");
      $("#userid").focus(); 
      return;
   }
   if(userpasswd==""){
      alert("패스워드를 입력하세요.");
      $("#userpasswd").focus(); 
   return ;
   }
   document.form2.action="${path}/client_servlet/loginCheck.do";
   document.form2.submit();   
   }
function findingId() {
	window.open("${path}/client_servlet/findingId.do", "findingId", "width=600px, height=400px, top=300px, left=650px");
}

</script>
<c:if test="${param.message == 'error' }">
  <script>
    alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  </script>
</c:if>
<c:if test="${param.message == 'logout' }">
  <script>
    alert("로그아웃 되었습니다.");
  </script>
</c:if>
<style type="text/css">
div#loginglass {
position: relative;
height: 200px;
top:250px;
bottom: 100px;
}
</style>
</head>
<body>
<form method="post" name="form2">
  <div class="loginclass" id="loginglass" >
<table border="1" align="center">
  <tr>
    <td>아이디</td>
    <td><input name="userid" id="userid"></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="userpasswd" id="userpasswd"></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <button onclick="loginCheck()" class="btn btn-login">로그인</button>        
       <button class="btn btn-join"><a  href="${path}/client_servlet/join.do">회원가입</a></button>
    <h4>아이디를 잊어버렸나요?</h4><a class="aInsignin" href="#" onclick="findingId()">아이디 찾기</a>
    </td> 
  </tr>
  </div>
</table>
<br><br><br><br><br><br><br><br>
</form>
<br><br><br><br><br><br>
<div id="footer">
<%@ include file="../include/footer.jsp"%>
</div>
</body>
</html>
