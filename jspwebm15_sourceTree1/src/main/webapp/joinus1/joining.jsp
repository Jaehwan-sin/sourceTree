<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joining</title>
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw2 = request.getParameter("pw2");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");

	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = String.format("%s-%s-%s", year, month, day);

	String islunar = request.getParameter("IsLunar");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");

	//String hobby = request.getParameter("hobby");  항목이 여러개 일 수 있어 배열로 받아야함
	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "";
	if(hobbies!=null){
		for (int i = 0; i < hobbies.length; i++) {
			hobby += hobbies[i];
			if(hobbies.length>i+1){
				hobby+="";
			}
		}
	}

	//join.jsp로 에러 메시지 전송
	//아이디 없음, 비번 불일치
	List<String> errors = new ArrayList();
	if(id==null || id.equals("")){
		errors.add("아이디없음");
	}
	if(!pw.equals(pw2)){
		errors.add("비번불일치");
	}
	//오류가 1개 이상 있을 시
	if(errors.size()>0){
		/* response.sendRedirect("join.jsp"); */
		//request에 error를 보관
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("join.jsp").forward(request, response);	// request에 담긴 정보로 response
	}else{
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,sysdate)";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pwd = "123456";
		Connection con = DriverManager.getConnection(url, user, pwd);

		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1,id);
		pst.setString(2,pw);
		pst.setString(3,name);
		pst.setString(4,gender);
		pst.setString(5,birth);
		pst.setString(6,islunar);
		pst.setString(7,tel);
		pst.setString(8,email);
		pst.setString(9,hobby);
		
		//실행
		pst.executeUpdate();
		
		//메인페이지 이동
		response.sendRedirect("./index.jsp");
	}
	
	
	%>
</body>
</html>