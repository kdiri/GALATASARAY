

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String username=request.getParameter("username"); 
String password2=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root",""); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from profile where username='"+username+"'"); 
if(rs.next()) 
{ 
if((rs.getString("password").equals(password2)) && (rs.getString("username").equals(username)))
{ 
session.setAttribute("username", username);
session.setAttribute("password", password2);
session.setAttribute("discipline", rs.getString("discipline"));

out.println("welcome"+username); 
String site = new String("http://localhost:8080/JspDeneme/session.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location",site);
} 
else 
{ 

String redirectURL = "http://localhost:8080/JspDeneme/login.jsp";
out.println("Invalid password try again"); 
response.sendRedirect(redirectURL); 
} 
}
else 
{
	String redirectURL = "http://localhost:8080/JspDeneme/login.jsp";
	out.println("Invalid password try again"); 
	response.sendRedirect(redirectURL);
}
%>