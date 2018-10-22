<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width-device-width",initial-scale="1">
<title>Insert title here</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<nav class="navbar navbar-default">
<div class="container-fluid">
<div class="navbar-header">
<button type = "button" class ="navbar-toggle collapsed" data-toggle="collapse"
data-target="#bs-exmaple-navbar-collapse-1" aria-expanded="false">
<span class="sr-only"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="main.html"><h2>임종현</h2></a>
</div>
<div class="collapse navbar-collapse" id ="bs-exmaple-navbar-collapse-1">
<ul class=" nav navbar-nav">
<li class="active"><a href="#">로로<span class="sr-only"></span></a></li>
<li><a href="#">asd</a></li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
aria-haspopup="true" aria-expanded="false">옷<span class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
</ul>
</li>
</ul>
</div>
</div>
</nav>

</body>
</html>