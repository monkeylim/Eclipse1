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
function backToMain() {
	location.href="${path}/board/main.jsp";
	
}

</script>

</head>
<body>
     <div id="content" align="center" >
         <div id="content-inner"><br><br><br><br>
            <div class="content-join">
				<h2>${dto.name}님, 회원이 되신 걸 축하합니다.</h2><br><br>
				
				<table class="table-join-result" border="1" width="900px">
				<tr>
					<th>아이디</th>
		        	<th>이메일</th>
		        	<th>이름</th>
		        	
				</tr>
				<tr>
					<td>${dto.userid}</td>
					<td>${dto.email}</td>
					<td>${dto.name}</td>
					   
		        </tr>
		        <tr>
		        	<td colspan="7" align="center">
		        		<input class="btn-Type1" type="button" value="홈으로" onclick="backToMain()">
		        	</td>
		        </tr>
  				</table>
  			 </div>
</body>
</html>