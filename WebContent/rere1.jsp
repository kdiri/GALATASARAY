<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
	String username = request.getParameter("username");
	session.putValue("username", username);
	String password = request.getParameter("password");
	String discipline = request.getParameter("discipline");

	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/final", "root", "");
	Statement st = con.createStatement();
	ResultSet rs;
	int i = st
			.executeUpdate("insert into profile (username, password , discipline) values ('"
					+ username
					+ "','"
					+ password
					+ "','"
					+ discipline
					+ "'" + ");");
	//int k=st.executeUpdate("insert into recherche (username) values ('"+username+"')");
	String site = new String(
			"http://localhost:8080/JspDeneme/login.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
%>
