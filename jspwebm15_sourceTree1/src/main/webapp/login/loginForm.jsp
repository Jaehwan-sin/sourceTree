<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join_style.css" />
<script>

function checkValue() {
	inputForm = eval("document.logininfo"); // logininfo의 정보를 객체로 가져오기
	if (!inputForm.id.value) {
		inputForm.id.focus();
		return false;
	}
	if (!inputForm.password.value) {
		inputForm.password.focus();
		return false;
	}
}

function goJoinForm() {
	location.href="../joinus/join.jsp";
}
</script>
</head>
<body>
<div id="wrap">
<h2>loginForm</h2>
<form action="loginproc.do" name="logininfo" method="post" onsubmit="return checkValue()">
	<img src="../img/welcome.jpg" alt="wel_img" />
	<br /><br />
	<table>
		<tr>
			<td bgcolor="skyblue">아이디</td>
			<td><input type="text" name="id" maxlength="50" /></td>
		</tr>
		<tr>
			<td bgcolor="skyblue">비밀번호</td>
			<td><input type="text" name="password" maxlength="50" /></td>
		</tr>
	</table>
	<input type="submit" value="login" />
	<input type="button" value="join" onclick="goJoinForm()" />
</form>
<%
	String msg = request.getParameter("msg");
	if(msg!=null && msg.equals("0")) {
		out.println("<br>");
		out.println("<font color='red' size='5'>비밀번호 확인</font>");
	} else if(msg!=null && msg.equals("-1")) {
		out.println("<br>");
		out.println("<font color='red' size='5'>아이디 확인</font>");
	}
%>
</div>
</body>
</html>