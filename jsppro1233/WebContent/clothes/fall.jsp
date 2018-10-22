<%@ include file="../include/session_check.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ROMANTIC</title>
<%@ include file="../include/header.jsp" %>
<script>
function coat1() {
	window.open("../images/coat2.png", "findingId", "width=600px, height=400px, top=300px, left=650px");
}
function coat2() {
	window.open("../images/coat5.png", "findingId", "width=600px, height=400px, top=300px, left=650px");
}
function coat3() {
	window.open("../images/fall.png", "findingId", "width=600px, height=400px, top=300px, left=650px");
}
</script>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">


</head>
<body style="text-align: center;">
 <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
            <p><h1>이 옷은 어떠세요?<br><br> it itmes!</h1></p>
            <p>찬바람 부는 가을. <br> 멋스러운 가을 남자 코디 </p>
          </div>
          <br>
          <hr>
          <div class="row">
            <div class="col-xs-6 col-lg-4">
              <h2>버버리 코트</h2>
              <img src="../images/coat1.png" style="width: 100%;" class="img-thumbnail"><br>
              <p><a class="btn btn-default" style="margin: 1em;" href="#" role="button" onclick="coat1()">자세히 보기 »</a></p>
            </div>
            <div class="col-xs-6 col-lg-4">
               <h2>베이지 코트</h2>
              <img src="../images/coat3.png" style="width: 100%;" class="img-thumbnail"><br>
              <p><a class="btn btn-default" style="margin: 1em;" href="#" role="button" onclick="coat2()">자세히 보기 »</a></p>
            </div>
            <div class="col-xs-6 col-lg-4">
               <h2>컬러 니트</h2>
              <img src="../images/fall1.png" style="width: 100%;" class="img-thumbnail"><br>
              <p><a class="btn btn-default" style="margin: 1em;" href="#" role="button" onclick="coat3()">자세히 보기 »</a></p>
            </div>     
          </div>
        </div>

        <div class="col-sm-3 sidebar-wrapper" id="sidebar">
          <div class="list-group">
            <a href="#" class="list-group-item active">운영자 예상 HOT템</a>
            <a href="#" class="list-group-item">롱패딩</a>
            <a href="female.jsp" class="list-group-item">여성</a>     
          </div>
        </div>
      </div>

      <hr>

    </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>