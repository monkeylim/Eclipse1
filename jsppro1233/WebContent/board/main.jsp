<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ROMANTIC</title>
<script type="text/javascript"></script>
<link  rel="stylesheet" href="../board/NewFile.css">
<%@ include file="../include/header.jsp"%>
<script>
function logout(){
	location.href="${path}/client_servlet/logout.do";
}

</script>
<style type="text/css">
.jumbotron {
	background-color: white;
	background-size: cover;
}
</Style>
</head>
<body>
	<header>
		<h2>&nbsp;CLOTHES</h2>
		<div class="topclass">
			&nbsp;&nbsp; a basic fits clothing site
		</div>
		<br>
		<br>
		<br>
		<br>
		<div class="container" align="center">
			<div class="jumbotron">
				<c:if test="${sessionScope.userid != null}">
              <h2><div class="welcome">${sessionScope.name}님 </div></h2>
              </c:if>
              <h3 class="text-center">환영합니다.</h3> 
              
				<p class="text-center">
				<c:choose>
				<c:when test="${sessionScope.userid == null}">
					<a class="btn btn-primary btn-lg" href="${path}/client_servlet/login.do" role="button">로그인</a>
					<a class="btn btn-primary btn-lg" href="${path}/client_servlet/join.do" role="button">회원가입</a>
				</c:when>
			 <c:otherwise>
            <a class="btn btn-primary btn-lg" href="#" onclick="logout()" role="button">로그아웃</a> 
            <a class="btn btn-primary btn-lg" href="#" role="button"">내 정보</a>
            </c:otherwise>
				</c:choose>
				</p>
				
			</div>
		</div>

	</header>
	<section>
		<div id="slider">
			<figure>
				<img src="../images/slide1.png">
				<img src="../images/slide2.png">
				<img src="../images/slide3.png">
				<img src="../images/slide4.png">
				<img src="../images/slide5.png">
			</figure>
		</div>
	</section>
	<div class="footer">
<%@ include file="../include/footer.jsp"%>
</div>
</body>
</html>










