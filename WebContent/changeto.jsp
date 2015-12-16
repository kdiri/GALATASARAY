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
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final","root","root"); 
Statement st= con.createStatement();
Statement stt= con.createStatement();
String kml = session.getValue("username").toString() ;
//out.println(session.getValue("username").toString());
ResultSet rs=st.executeQuery("select * from profile where username='"+kml+"'"); 
ResultSet rst=stt.executeQuery("select * from recherche where username='"+kml+"'");

//String Mah1 = session.getValue("username").toString() ;

%>
 <br/><br/><br/><br/><br/>
 <form action="session" method="post">
 <table align="center">
 

			 <tr>
 			<td colspan="2"><h2>Profile Page</h2></td>
 			</tr>
            <% while(rs.next()){ %>
            
            <%if(rs.getString(1)!= null){ %>
	            <tr>
		         <td>username : </td>   
	        	<td><textarea  name='Username' id='Username'><%=rs.getString(1)%></textarea> <br></td></tr>
   			<%} %>
   			
		   <%if(rs.getString(2)!= null){ %>
		   		 <tr>
		         <td>password : </td>         
		        <td><textarea name='Password' id='Password'><%=rs.getString(2)%></textarea> <br> </td></tr>
		   <%} %>
		   <%if(rs.getString(3)!= null){ %>
		   		 <tr>
		   		 <td>role : </td>              
		        <td><textarea name='Role' id='Role'><%=rs.getString(3)%></textarea> <br> </td> </tr>
		   <%} %>
		   <%if(rs.getString(4)!= null){ %>
		  		<tr>
		         <td>Domain of Interest : </td>         
		        <td><textarea name='Domain of Interest' id='Domain of Interest'><%=rs.getString(4)%></textarea> <br></td></tr>
		   <%} %>
		   
            <% } %>
            <%String s="";
            int i= 1 ;%>
            <% while(rst.next()){ %>
       			<%if(rst.getString(2)!= null){
       			 
       		     s+=String.valueOf(i);
       		     s=s.concat("=");
       			 s+=(String.valueOf(rst.getString(4))) ;
       			 s=s.concat("|");
       			 i++;
       			 %>
       			<%} %>
       			<% } %>
		   		 <tr>
				 <td>Searched Words</td>
				 <td><input row='4' type="text" name="Consulted Projects" value=<%=s%> readonly /></td>
				</tr>
		   
            
        


 <tr>
 <td>&nbsp;</td>
 <a href="session.jsp"><input type="button" value="Home Page" name="Home Page"/></a>
 <a href="profile.jsp"><input type="button" value="profile" name="profile"/></a>
 <a href="change.jsp"><input type="button" value="submit" name="change"/></a>
 
 </tr>
 </table>
 </form>
</body>
</html>