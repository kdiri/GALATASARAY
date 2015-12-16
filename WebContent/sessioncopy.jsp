<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Armadillo Search Engine</title>
</head>
<body>
  			

<form   method="post" action="test.jsp">
            Search : <input type="text" name="Search"/>
            <br/>
            <input type="submit" name="Search" value="Search">
 
<a href="profile.jsp"><input type="button" value="Profile" name="Profile"/></a>   
<a href="logout.jsp"><input type="button" value="Logout" name="Logout"/></a>

</form>
<% 			//while(true){
            FileReader in = new FileReader("/home/kdiri/Desktop/TEZ/kemal/pass2.txt");
            BufferedReader br = new BufferedReader(in);
            
            String line;
            while ((line = br.readLine()) != null) {%>
            	<tr>
		         <td>result : </td>         
		        <td><textarea name='Password' id='Password'><%=line%></textarea> <br> </td></tr>
            <% }
            in.close();
            PrintWriter writer = new PrintWriter("/home/kdiri/Desktop/TEZ/kemal/pass2.txt");
            writer.print("");
            writer.close();
			//}
            %>

</body>
</html>