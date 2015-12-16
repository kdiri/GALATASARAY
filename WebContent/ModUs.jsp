<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String password=request.getParameter("password"); 
String kml=request.getParameter("Username"); 

//session.putValue("username",username); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root",""); 
Statement st= con.createStatement(); 
//ResultSet rs; 
int i=st.executeUpdate("update profile set password='"+password+"' where username='"+kml+"'"); 
System.out.print("SUCCESS");
String site = new String("http://localhost:8080/JspDeneme/session.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);

%>