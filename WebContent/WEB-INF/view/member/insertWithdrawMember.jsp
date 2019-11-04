<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
table, td {
	border: 0.1px solid gray;
}

table {
	border-collapse: collapse;
}

.left {
	background-color: #FFF2E6;
	width: 150px;
	height: 40px;
	padding-left: 20px;
}

.right {
	width: 700px;
	height: 40px;
	padding-left: 10px;
}

input {
	height: 17px;
}

#con, table {
	margin-top: 200px;
	margin-left: 270px;
}

#bottom {
	margin-top: 17px;
	margin-left: 700px;
}

#Line {
	font-weight: bold;
	font-size: 16px;
}

#join {
	height: 27px;
	background-color: #6CC0FF;
	color: white;
	border-radius: 7px 7px 7px;
	font-weight: bold;
}

#cancel {
	height: 27px;
}

.input {
	display: none;
}
</style>

</head>
<body>

	<form action="add.do" method="post">

		<div id="con">

			<table>

				<tr>
					<td class="left">회원분류</td>
					<td class="right" id="Line">D멤버스 회원</td>
				</tr>

				<tr>
					<td class="left"><label>이름 </label></td>
					<td class="right"><input type="text" name="name">&nbsp;&nbsp;<span
						class="input">이름을 입력하세요.</span></td>
				</tr>

				<tr>
					<td class="left"><label>아이디 </label></td>
					<td class="right"><input type="text" name="id" id="id"
						placeholder="4자 이상 15자 이하 아이디">&nbsp;&nbsp;
						<button id="btnCheck" type="button">아이디 중복체크</button> &nbsp;&nbsp;

						<%-- <c:if test="${result == 1 } }">
							<p id="exist">존재하는 아이디입니다</p>
						</c:if> <c:if test="${result != 1 } }">
							<p id="enable">사용가능한 아이디입니다</p>

						</c:if> --%> <span id="show"></span><span class="input">아이디를 입력하세요.</span></td>
				</tr>

				<tr>
					<td class="left"><label>비밀번호 </label></td>
					<td class="right"><input type="password" name="password"
						id="password" placeholder="4자 이상 17자 이하 비밀번호"
						onkeyup="passwordCheckFunction()">&nbsp;&nbsp;<span
						class="input">4자리 이상의 17자리 이하의 비밀번호를 입력하세요.</span></td>
				</tr>

				<tr>
					<td class="left"><label>비밀번호 확인 </label></td>
					<td class="right"><input type="password" name="passwordCheck"
						id="passwordCheck" onkeyup="passwordCheckFunction()">
						&nbsp; <span id="pass"></span></td>
				</tr>

				<tr>
					<td class="left"><label>전화번호 </label></td>
					<td class="right"><input type="text" name="number"
						placeholder="-없이 입력해주세요">&nbsp;&nbsp;<span class="input">전화번호를
							입력하세요.</span></td>
				</tr>

				<tr>
					<td class="left"><label>이메일 </label></td>
					<td class="right"><input type="text" name="email">&nbsp;&nbsp;<span
						class="input">이메일을 입력하세요.</span></td>
				</tr>

				<tr>
					<td class="left"><label>생년월일</label></td>
					<td class="right"><input type="date" name="date">&nbsp;&nbsp;<span
						class="input">생년월일을 입력하세요.</span></td>
				</tr>

			</table>

			<div id="bottom">
				<input type="submit" value="회원 가입" id="join"> <input
					type="reset" value="취소" id="cancel">
			</div>

		</div>

	</form>

	<script>
	// 회원가입시 아이디 중복체크 확인을 위한 변수
	var avail_id = "";
	
		$(function() {			
			$("form").submit(function() {

				var Name = /^[가-힣]{2,13}$/;
				var name = $("input[name = 'name']").val();

				if (Name.test(name) == true) {
					$(".input").eq(0).css("display", "none");
				} else {
					$(".input").eq(0).css("display", "inline");
					return false;
				}

				var Id = /^[a-zA-Z0-9]{4,15}$/;
				var id = $("input[name='id']").val();

				if (Id.test(id) == true) {
					$(".input").eq(1).css("display", "none");
				}else {
					$(".input").eq(1).css("display", "inline");
					return false;
				}

				var Password = /^[a-zA-Z0-9]{4,13}$/;
				var password = $("input[name='password']").val();

				if (Password.test(password) == true) {
					$(".input").eq(2).css("display", "none");

				} else {
					$(".input").eq(2).css("display", "inline");
					return false;
				}

				var Number = /^[0-9]{10,11}$/;
				var number = $("input[name='number']").val();

				if (Number.test(number) == true) {
					$(".input").eq(3).css("display", "none");

				}else {
					$(".input").eq(3).css("display", "inline");
					return false;
				}

				var Email = /^[a-zA-Z0-9]{4,17}/;
				var email = $("input[name='email']").val();

				if (Email.test(email) == true) {
					$(".input").eq(4).css("display", "none");
				} else {
					$(".input").eq(4).css("display", "inline");
					return false;
				}

				var date = $("input[name='date']").val();

				if (date != "") {
					$(".input").eq(5).css("display", "none");
				} else if (date == "") {
					$(".input").eq(5).css("display", "inline");
					return false;
				}
				
				var password1 = $("#password").val();
				var password2 = $("#passwordCheck").val();
				
				if (password1 != password2) {
					$("#pass").text("비밀번호를 확인해주세요");
					alert("비밀번호를 확인해주세요")
					return false;
				}
				
				var now_id = $("input#id").val();
				if(avail_id != now_id) {
					alert("아이디 중복확인을 해주세요.");
					return false;
				}
				
			})

		})

		function passwordCheckFunction() {

			var password1 = $("#password").val();
			var password2 = $("#passwordCheck").val();

		if (password1 != password2) {
				$("#pass").text("비밀번호가 일치하지 않습니다")
				$(".input").eq(2).css("display", "none");
				
			} else {
				$("#pass").text("비밀번호가 일치합니다")
			}

		}
		
		
		
		$(document).on("click", "#btnCheck", function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/idCheck.do",
				type : "get",
				data : {
					"id" : $("#id").val()
				},
				dataType : "json",
				success : function(res) {
					console.log(result);

					var result = res.result;
					
					var id = $("input[name='id']").val();

					if (id == "") {
						$("#show").text("아이디를 입력해주세요");
						return false;
					}else if(id.length < 4 || id.length > 15 ){
						$("#show").text("4자 이상 15자 이하 아이디를 입력해주세요");				
						return false;
					}

					if (result == "fail") {
						$("#show").text("사용 가능한 아이디 입니다");
						avail_id = $("#id").val();
					} else if (result == "success") {
						var text = $("#show").text("존재하는 아이디입니다");
							return false;
					}					
					
				}
			})
		})
	</script>

	<%@ include file="../include/footer.jsp"%>