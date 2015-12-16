<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Galata Search</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yummy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="login.jsp">G-Search</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form">
							<input type="text" class="form-control" readonly>
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								Rechercher
							</button>
						</form>
					</div>	
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					<div id="loginBox">                
						<form id="loginForm" action="aa.jsp" method="post">
							<fieldset id="body">
								<fieldset>
									<label for="email">Login</label>
									<input type="text" name="username" id="Login">
								</fieldset>
								<fieldset>
									<label for="password">Password</label>
									<input type="password" name="password" id="password">
								</fieldset>
								<input type="submit" id="login" value="Connexion">
								
							</fieldset>
							<p>Nouveau utilisateur ? <a class="sign" href="rere.jsp">S'enregistrer</a></p>
						</form>
					</div>
				</div>
				
				<div class="clearfix"> </div>
			</div>
			
		</div>
	</div>
	<!--//header-->
	<!--banner-->
	<div class="banner">
		<div class="container" style="margin-top : -100px;">
			<h2 class="hdng"><span>Galatasaray</span> Search</h2>
			<br /><br />
			<div class="subscribe" style="background-image : 'red'; font-weight: bold; height:500px;">
		 <div>
			 <h3>Recherche</h3>
			 <form>
				 <input type="text" class="text" value="Mot clé"  readonly onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
				 <input type="submit" value="Rechercher" >
			 </form>
		 </div>
	     </div>
			
		</div>
	</div>			
	<!--//banner-->
	<!--gallery-->
	<div >
		<div>
			
		</div>
	</div>
	<!--//gallery-->
	<!--subscribe-->

	<!--//subscribe-->
	<!--footer-->
	
	</div>
	<!--//footer-->
	<br /><br />	<br />	<br />	
	
</body>
</html>

