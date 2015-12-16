<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>

<%

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root",""); 
Statement st= con.createStatement();
Statement stt= con.createStatement();
String kml = session.getValue("username").toString() ;
//out.println(session.getValue("username").toString());
ResultSet rs=st.executeQuery("select * from profile where username='"+kml+"'"); 
ResultSet rst=stt.executeQuery("select * from recherche where username='"+kml+"'");

//String Mah1 = session.getValue("username").toString() ;

%>
 <br/><br/><br/><br/><br/>
 <form action="ModUs.jsp" method="post">
 <table align="center">
 

			 <tr>
 			<td colspan="2"><h2>Modify Your Informations</h2></td>
 			</tr>
 			<tr>
			 <td colspan="2"><h2>Modify password</h2></td>
			 </tr>
			 <tr>
			 <td>new password</td>
			 <td><input type="text" name="password" /></td>
			 </tr>
			 <tr>
			 <tr>
			 <td>&nbsp;</td>
			 <td><a href="ModPa.jsp"><input type="submit" value="Registrate"> </a> </td>
			 </tr>
            <% while(rs.next()){ %>
   			
		   <%if(rs.getString(2)!= null){ %>
		   		 <tr>
		         <td>username : </td>         
		        <td><textarea name='Username' id='Username' readonly><%=rs.getString(2)%></textarea>
		         <br> </td></tr>
		   <%} %>
		   <%if(rs.getString(3)!= null){ %>
		   		 <tr>
		   		 <td>role : </td>              
		        <td><textarea name='Role' id='Role'><%=rs.getString(3)%></textarea><a href="ModRole.jsp"><b>Modify Role</b></a>
		         <br> </td> </tr>
		   <%} %>
		 
		   
            <% } %>
            <%String s="";
            int i= 1 ;%>
            <% while(rst.next()){ %>
            	<%if(rst.getString(4)!= null){ %>
		  		<tr>
		         <td>Domain of Interest : </td>         
		        <td><textarea name='Consulted Projects' id='Consulted Projects'><%=rst.getString(4)%></textarea><a href="logout.jsp"><b>Modify Domain Of Interest</b></a>
		         <br></td></tr>
		   <%} %>
       			<%if(rst.getString(3)!= null){
       			 
       		     s+=String.valueOf(i);
       		     s=s.concat("=");
       			 s+=(String.valueOf(rst.getString(3))) ;
       			 s=s.concat("\n");
       			 i++;
       			 %>
       			<%} %>
       			<% } %>
		   		 <tr>
				 <td>Searched Words</td>
				 <td><textarea name="Consulted Projects" style='height:80px'><%= s %></textarea></td>
				</tr>
		   
            
        


 <tr>
 <td>&nbsp;</td>
 <a href="session.jsp"><input type="button" value="back" name="back"/></a>
 <a href="change.jsp"><input type="button" value="change" name="change"/></a>
 
 </tr>
 </table>
 </form>
</body>
</html>
 

