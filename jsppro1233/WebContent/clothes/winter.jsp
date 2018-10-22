<%@ include file="../include/session_check.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("img").bind({
		
		mouseout  : function() {
			$("img").attr("src", "../images/out3.png");
		},
		click : function() {
			$("img").attr("src", "../images/out2.png");
		}
	});
});
$(function() {
	
	 var currentPosition = parseInt($("#slidemenu").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		console.log("스크롤바의 좌표: "+position);
		$("#slidemenu").stop().animate({
			"top" : position + currentPosition + "px"
		}, 500);
	});

 });
</script>
</head>
<body>
<section>
<img src ="../images/out1.png"><br><br><br>

<div id ="slide">
<h4></h4>
</div>
</aside>
</section>



<%@ include file="../include/footer.jsp" %>

</body>
</html>