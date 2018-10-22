<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp"%>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
	function check() {
		var name = document.form1.name.value;
		var userid = document.form1.userid.value;
		var userpasswd = document.form1.userpasswd.value;
		var email = document.form1.email.value;
		/* if (name == "") {
			alert("이름을 입력하지않았습니다");
			$("#name").focus();
			return;
		}
		if (userid == "") {
			alert("아이디를 입력하지않았습니다");
			$("#userid").focus(); //입력 포커스 이동
			return;
		}
		if (userpasswd == "") {
			alert("패스워드를 입력하지않았습니다");
			$("#userpasswd").focus();
			return;
		}
		if (email == "") {
			alert("이메일을 입력하지않았습니다");
			$("#email").focus();
			return;
		}
		  if(!$('#chk').is(":checked")){
              alert('약관동의를 체크해 주세요.')            
              return ;            
          }
		  var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{3,10}$/;
			if (!regname.test(name)) {
				alert("유효하지 않은 이름입니다.");
				document.form1.name.focus();
				return;
			}
			var regId = /^[a-z0-9][a-z0-9]{4,19}$/;
			if (!regId.test(id)) {
				alert("유효하지 않은 아이디입니다.");
				document.form1.userid.focus();
				return;
			}  
			var regEmail = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
			if (!regEmail.test(email)) {
				alert("유효하지 않은 이메일입니다.");
				document.form1.email.focus();
				return;
			} */

		document.form1.action = "${path}/client_servlet/joinCheck.do";
		document.form1.submit();
		alert("회원가입 완료");
	}
	function checkName() {
		var transTextColor = document.getElementById("nameConfirmArea");
		var name = document.form1.name.value;
		var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{3,10}$/;

		if (!regname.test(name)) {
			transTextColor.style.color = "red";
			document.getElementById("nameConfirmArea").innerHTML = " 유효하지 않은 이름입니다.";
			document.form1.name.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("nameConfirmArea").innerHTML = " 유효한 이름입니다.";
		}
	}
	function checkId() {
		var transTextColor = document.getElementById("idConfirmArea");
		var userid = document.form1.userid.value;
		var regId = /^[a-zA-Z0-9]+$/;
		   
		if (!regId.test(userid)) {
			transTextColor.style.color = "red";
			document.getElementById("idConfirmArea").innerHTML = " 유효하지 않은 아이디입니다.";
			document.form1.userid.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("idConfirmArea").innerHTML = " 유효한 아이디입니다.";
		}	
	}
	function checkEmail() {
		var transTextColor = document.getElementById("emailConfirmArea");
		var email = document.form1.email.value;
		var regEmail = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	   
		if (!regEmail.test(email)) {
			transTextColor.style.color = "red";
			document.getElementById("emailConfirmArea").innerHTML = " 이메일 형식에 맞게 입력해주세요.";
			document.form1.email.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("emailConfirmArea").innerHTML = " 유효한 이메일입니다.";
		}
	}
</script>
</head>
<body>
	<form name="form1" id="form1" method="post">

		<div class="container">
			<div
				style="width: 650px; border: 1px solid #cccccc; margin: 0px auto; padding: 20px; background-color: #ffffff">
				<h3>회원정보입력</h3>
				<hr />

				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px">이름</label> <input type="text" id="name"
						name="name"onchange="checkName()"  placeholder="한글이름 (세 글자이상)가능 " />
						<br><span class="confirmArea" id="nameConfirmArea"> </span>
				</div>

				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px">아이디</label> <input type="text"
						id="userid" name="userid" onchange="checkId()" placeholder="아이디입력" /> <br>*숫자,알파벳을 이용한  아이디만 가능합니다.
				<br><span class="confirmArea" id="idConfirmArea"> </span>
				</div>

				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px">비밀번호</label> <input type="password"
						name="userpasswd" id="userpasswd" placeholder="비밀번호입력" />
				</div>

				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px">이메일</label> <input type="email"
						name="email" id="email" onchange="checkEmail()" placeholder="이메일" />
                  <br><span class="confirmArea" id="emailConfirmArea"> </span>
				</div>

				<!-- <div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px">생년월일</label> <input type="text"
						name="birth1" id="birth1" style="width: 70px" placeholder="2017" />
					<select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select> <select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						<option>19</option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
						<option>23</option>
						<option>24</option>
						<option>25</option>
						<option>26</option>
						<option>27</option>
						<option>28</option>
						<option>29</option>
						<option>30</option>
						<option>31</option>
					</select>
				</div>

				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px">주소</label> <input type="text" id="ad1"
						name="ad1" placeholder="우편번호" /> 
				</div>

				<div class="form-inline" style="margin-bottom: 5px">
					<label style="width: 150px;"></label> <input type="text" id="ad2"
						name="ad2" style="width: 300px" placeholder="도로명주소" /> <input
						type="text" id="ad3" name="ad3" style="width: 150px"
						placeholder="지번주소" />
				</div> -->

				<div class="form-inline" style="margin-bottom: 5px">
					
					인터넷 쇼핑몰 『 로맨틱 사이버 몰』회원 약관 제1조(목적) 이 약관은
						로맨틱 회사(전자상거래 사업자)가 운영하는 로맨틱 사이버 몰(이하 "몰"이라 한다)에서 제공하는
						인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을
						목적으로 합니다. * 「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준
						용합니다」 제2조(정의) ①"몰" 이란 로맨틱 회사가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게
						제공하기 위하여 컴 퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울 러
						사이버몰을 운영하는 사업자의 의미로도 사용합니다. ②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는
						서비스를 받는 회원 및 비회원을 말합니다. ③ '회원'이라 함은 "몰"에 개인정보를 제공하여 회원등록을 한 자로서,
						"몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다. ④
						'비회원'이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다. 제3조 (약관등의 명시와
						설명 및 개정) ① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수
						있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고 번호,
						개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 로맨틱파이어리츠 사이버몰의 초기 서비스화면(전면) 에 게시합니다.
						</div>
					<label style="width: 150px;"></label> <input type="checkbox"
						id="chk" name="chk" />약관동의합니다.
				


				<hr />
				<div align="center">
					<button onclick="check()" class="btn btn-default">회원가입</button>

				</div>
			</div>
		</div>
	</form>
</body>
</html>