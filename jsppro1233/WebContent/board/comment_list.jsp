<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />  
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<table border="1" width="700px">
<c:forEach var="row" items="${list}">
 <tr>
   <td>
     ${row.writer}
     (<fmt:formatDate value="${row.reg_date}" 
       pattern="yyyy-MM-dd hh:mm:ss" />)<br>
     ${row.content}
   </td>
 </tr>
</c:forEach>
</table>
</body>
</html>