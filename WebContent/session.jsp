<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Galatasaray Search</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Yummy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 













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


	<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
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
				<!--//navbar-header-->
			</nav>
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
						<form id="loginForm" action="aa.jsp" method="post">
							<fieldset id="body">
								<fieldset>
									<label for="email"><h1 class="navbar-brand"
											style='font-size: 25px; color: brown;'>
											Utilisateur :
											<%
										String kml = session.getValue("username").toString();
																															out.println("   " + kml);
									%>

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
	<div class="banner">
		<div class="container" style="margin-top: -100px;">
			<h2 class="hdng">
				<span>Galatasaray</span> Search
			</h2>
			<br /> <br />
			<div class="subscribe"
				style="background-image: 'red'; height: 700px;">
				<div>
					<h3>Recherche</h3>


					<form method="post" action="test.jsp">



						<input type="text" class="text" value="Mot clé" name='Search'
							onfocus="this.value = '';"> <input type="submit"
							value="Rechercher" name="Search1">



					</form>

					<%
						//while(true){

															Class.forName("com.mysql.jdbc.Driver");
															Connection con = DriverManager.getConnection(
																	"jdbc:mysql://localhost:3306/final", "root", "");
															Statement st = con.createStatement();
															Statement rst = con.createStatement();

															String file_name = "C:/Users/user/Desktop/eclipse JEE/file__2/pass2.txt";
															String file_name2 = "C:/Users/user/Desktop/eclipse JEE/file__2/pass3.txt";
															FileReader in = new FileReader(file_name);
															BufferedReader br = new BufferedReader(in);
															FileReader in2 = new FileReader(file_name2);
															BufferedReader br2 = new BufferedReader(in2);

															ResultSet rs = st
																	.executeQuery("select discipline from profile where username='"
																			+ kml + "'");
															String discipline = null;
															if (rs.next()) {
																discipline = rs.getString("discipline");

															}
															ResultSet rs2 = st
																	.executeQuery("select fichier from discipline where discipline='"
																			+ discipline + "'");

															List fichier1 = new ArrayList<String>();
															List fichier2 = new ArrayList<String>();
															List fichier3 = new ArrayList<String>();
															List fichier4 = new ArrayList<String>();
															while (rs2.next()) {
																
																fichier1.add(rs2.getString("fichier"));
															

															}
															

															String line2;
															while ((line2 = br2.readLine()) != null) {
																String part1 = "";
																String part2 = "";
																String part0 = "";
																if (line2.contains("/")) {
																	String parts[] = line2.split("/");
																	part0 = parts[0];
																	part1 = parts[1];
																	part2 = parts[2];
																	float part22 = Integer.parseInt(part2);
																	
																	
																	String resres="";
																	String resres1="";
																	String resres2="";
																	String resres3="";
																	String [] tab = new String[fichier1.size()];
																	for(int i=0 ; i<fichier1.size() ; i++)
																	{
																	
																	
																			if(part1.equals(fichier1.get(i)))
																			{
																				part22 = part22*10;
																				resres3="";
																				
																			}
																		
																			
																			 resres ="Le mot "+part0+" a été trouvé dans le fichier " +part1+ ".  Son point est : "+part22+"" + " "; 
																			 
																			
																		
																		
																	}
																	fichier2.add(resres);
																	//Collections.sort(fichier2);
																	
																	//Collections.sort(fichier2, fichier2.get(0));
																	
																}
															}

															String line;
															String resp = "";
															while ((line = br.readLine()) != null) {
																resp = resp.concat(line) + "\n";

															}
					%>
					<br /> <br />
					<tr>
						<td></td>
						<td>
						<b>
						<textarea rows="10" cols="100" name='text' id='line'
								class="text" readonly
								style='font-family: Century Gothic; color: white; text-align: center; line-height: 30px; background-color: transparent;'
								border='0';
								><%
								for(int j=0 ; j<fichier2.size() ; j++)
								{
								out.println(fichier2.get(j));
								}
								
								%></textarea>
								</b><br></td>
					</tr>
					<%
						in.close();
					in2.close();
					
															PrintWriter writer = new PrintWriter(
																	"C:/Users/user/Desktop/eclipse JEE/file__2/pass2.txt");
															writer.print("");
															writer.close();
															line = null;

															PrintWriter writer2 = new PrintWriter(
																	"C:/Users/user/Desktop/eclipse JEE/file__2/pass3.txt");
															writer2.print("");
															writer2.close();
														
															//}
					%>





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





