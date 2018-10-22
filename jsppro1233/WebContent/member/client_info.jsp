<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$("#btnDelete").click(function() {
	if(confirm("탈퇴하시겠습니까?")) {
		document.form1.action="${path}/client_servlet/withdraw.do";
		document.form1.submit();
	}
});
</script>
</head>
<body>    
      <div class="modal-header" style="background-color: black;">        
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title" style="color:white;">회원정보/수정</h4>
      </div>
      <!-- body -->
      <form name="form3" method="post">
      <div class="modal-body"><br>   
       <input name="userid" id="userid" readonly="readonly" type="text" value="${dto.userid}" class="form-control" placeholder="아이디를 입력하세요"><br>
       <input name="userpasswd" id="userpasswd" type="password" value="${dto.userpasswd}" autocomplete="off" class="form-control" placeholder="비밀번호를 입력하세요"><br>
       <input name="name" id="name" type="text" value="${dto.name}" autocomplete="off" class="form-control" placeholder="이름을 입력하세요"><br>
       
       <input name="email" id="email" type="text" value="${dto.email}" autocomplete="off" class="form-control" placeholder="이메일주소을 입력하세요"><br>
       
       <button onclick="update()" class="btn btn-default">수정</button>      
         </div>
      </form>
</body>
</html>
