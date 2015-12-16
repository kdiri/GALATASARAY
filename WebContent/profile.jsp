
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Galata Search</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Yummy Responsive web template, Bootstrap Web Templates, Flat Web Templates, 

Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, 

SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 

function hideURLbar(){ window.scrollTo(0,1); } 







</script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/final", "root", "");
		Statement st = con.createStatement();
		Statement stt = con.createStatement();
		String kml = session.getValue("username").toString();
		//out.println(session.getValue("username").toString());
		ResultSet rs = st
				.executeQuery("select * from profile where username='"
						+ kml + "'");
		ResultSet rst = stt
				.executeQuery("select * from recherche where username='"
						+ kml + "'");

		//String Mah1 = session.getValue("username").toString() ;
	%>
	<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data- toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1 class="navbar-brand">
					<a href="session.jsp">G-Search</a>
				</h1>
			</div>
			<!--navbar-header-->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<!--/.navbar-collapse-->
			</div>
			<!--//navbar-header--> </nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search"
						aria-hidden="true"></span></a>
					<div class="search">
						<form class="navbar-form" method="post" action="test.jsp">
							<input type="text" class="form-control" name="Search">
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">Rechercher</button>
						</form>
					</div>
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user"
						aria-hidden="true"></span> </a>
					<div id="loginBox">
						<form id="loginForm">
							<fieldset id="body">
								<fieldset>
									<label for="email"><h1 class="navbar-brand"
											style='font-size: 25px; color: brown;'>
											Utilisateur :
											<%=kml%>

										</h1></label>

								</fieldset>
								<fieldset>
									<label style='font-size: 15px;'><a href="profile.jsp"
										style='color: #F07818;'>Mon Profil</a></label>

								</fieldset>

								<fieldset>
									<label style='font-size: 15px'><a href="logout.jsp"
										style='color: #F07818;'>Déconnexion</a></label>

								</fieldset>



							</fieldset>

						</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
	<!--//header-->
	<!--banner-->
	<div class="account">
		<div class="container">
			<div class="register">

				<div class="register-top-grid">
					<h3>Mon Profil</h3>

					<div class="input">
						<span>Login <label></label></span> <input type="text"
							value='<%=kml%>' readonly name='username'>
					</div>





					<div class="input">

						<%
							ResultSet rsD = st
									.executeQuery("select discipline from profile where username='"
											+ kml + "'");
							String discipline = null;
							if (rsD.next()) {
								discipline = rsD.getString("discipline");
							}
						%>
						<span>Discipline<label></label></span> <input type='text'
							name="discipline" readonly value='<%=discipline%>'>




					</div>

					<div class="input">
						<span>Mes Recherches <label></label></span>

<%
				String s = "";
			
				int i = 1;
			%>
			<%
				while (rst.next()) {
			%>
		
			<%
				if (rst.getString(3) != null) {
					s=s.concat("Recherche ");
					s+=String.valueOf(i);
	       		     s=s.concat("  =  ");
	       			 s+=(String.valueOf(rst.getString(3))) ;
	       			 s=s.concat("\n");
	       			 i++;
			%>
			<%
				}
			%>
			<%
				}
			%>
					<textarea rows="5" cols="90" name='text' id='line'
								class="text" readonly
								style='font-family: Century Gothic; color: black; text-align: center; line-height: 30px; background-color: transparent;'
								border='0';
								><%=s %></textarea>
					</div>

					<div class="clearfix"></div>
				</div>
				<div class="register-bottom-grid">
					<h3>Modification Password</h3>
					<div class="input">
						<%
							ResultSet rsP = st
									.executeQuery("select password from profile where username='"
											+ kml + "'");
							String password = null;
							if (rsP.next()) {
								password = rsP.getString("password");
							}
						%>
						
							<span>Password <label></label></span> <input type="password"
								name="passwordddd" readonly value='*********'>
					</div>
					<form action="change.jsp" method='post'>
					<div class="input">
						<span>Nouveau Password<label> *</label></span> <input
							type="password" name='password' required>
					</div>
						<div class="clearfix"></div>
				<div class="register-but">
					<br />
					<center>
						<input type="submit" value="Modifier" class="btn btn-default"
							style='background-color: #FF4500; width: 150px; color: white;'>
					</center>
					
					<div class="clearfix"></div>

				</div>
					</form>
				</div>
			
<br /><br /><br /><br />
	<div class="register-top-grid">
					<h3>Modification Discipline</h3>
					<div class="input">
						
						
							<span>Discipline</span> <input type='text'
								name="discipline22" value='<%=discipline%>' readonly>
					</div>
					
					<form action="change2.jsp" method='post'>
					<div class="input">
							<span>Nouvelle Discipline<label></label></span> <select name="discipline2"
								style='width: 656px; height: 40px;'>
								<option value="Biologie">Biologie</option>
								<option value="Sport">Sport</option>
								<option value="Technologie">Technologie</option>
								<option value="Art">Art</option>
								<option value="Sante">Santé</option>
								<option value="Tourisme">Tourisme</option>
								<option value="Culture">Culture</option>
								<option value="Zoologie">Zoologie</option>
								<option value="Geologie">Géologie</option>
								<option value="Science">Science</option>
							       </select>
						</div>
						<div class="clearfix"></div>
				<div class="register-but">
					<br />
					<center>
						<input type="submit" value="Modifier" class="btn btn-default"
							style='background-color: #FF4500; width: 150px; color: white;'>
					</center>
					
					<div class="clearfix"></div>

				</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--//banner-->
	<!--gallery-->
	<div>
		<div></div>
	</div>
	<!--//gallery-->
	<!--subscribe-->

	<!--//subscribe-->
	<!--footer-->

	</div>
	<!--//footer-->
	<br />
	<br />
	<br />
	<br />

</body>
</html>



