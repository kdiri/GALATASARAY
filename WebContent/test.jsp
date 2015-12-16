<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="kml.javaEx7"%>


<%
	//File creation
	String username = request.getParameter("username");
	//session.putValue("username",username); 
	String Search = request.getParameter("Search");
	String strPath = "C:/Users/user/Desktop/eclipse JEE/file__2/pass.txt";
	File strFile = new File(strPath);
	boolean fileCreated = strFile.createNewFile();
	//File appending
	Writer objWriter = new BufferedWriter(new FileWriter(strFile));
	objWriter.write(Search);
	objWriter.flush();
	objWriter.close();
	
	kml.javaEx7 obj = new kml.javaEx7(); 
	   
	   obj.function();
	
	String kml = session.getValue("username").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/final", "root", "");
	Statement st = con.createStatement();
	

	ResultSet rs = st
			.executeQuery("SELECT MAX(userid) AS userid FROM profile");
	if(rs.next()) {
		int lastid = rs.getInt("userid");
		lastid = lastid + 1;

		//ResultSet rs; 
		System.out.print(username);
		//int i=st.executeUpdate("update profile set searchedwords='"+Search+"' where username='"+kml+"'");
		String Cons = null;
		int updateQuery = 0;
		//if (Search.equals(Camera) || Search.equals(Travel)){
		int k = st
				.executeUpdate("INSERT INTO `final`.`recherche` (`userid`, `username`, `searchedwords`, `consultedprojects`, `domain`) VALUES ("+lastid + ", '"+kml+"', '"+Search+"', '"+Cons+"', '');");
	}
	String site = new String(
			"http://localhost:8080/JspDeneme/session.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
%>