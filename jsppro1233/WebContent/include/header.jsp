<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />  
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<header>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-exmaple-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="../board/main.jsp"><h2>ROMANTIC</h2></a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-exmaple-navbar-collapse-1">
					<ul class=" nav navbar-nav">
						<li class="active"><a href="../board/newarrivals.jsp"><h3>New arrivals</h3></a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><h3>StyleBook</h3>
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">2018Spring</a></li>
								<li><a href="#">2018Summer</a></li>
								<li><a href="${path}/clothes/fall.jsp">2018Fall</a></li>
								<li><a href="#">2017Winter</a></li>
							</ul></li>
						<li><a href="#"><h3></h3></a></li>
						<li><a href="${path}/board_servlet/list.do"><h3>Notice</h3></a></li>
						<li><a href="#"><h3>Event</h3></a></li>
						
					</ul>
				</div>
			</div>
		</nav>
 </body>