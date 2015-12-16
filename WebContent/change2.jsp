<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String username = session.getValue("username").toString();
String discipline=request.getParameter("discipline2");  
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root",""); 
Statement st= con.createStatement(); 
//ResultSet rs; 
int i=st.executeUpdate("update profile set discipline='"+discipline+"' where username='"+username+"';"); 
System.out.print("SUCCESS");
String site = new String("http://localhost:8080/JspDeneme/profile.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);

%>