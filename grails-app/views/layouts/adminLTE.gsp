<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><g:layoutTitle default="Animals" /></title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<asset:link rel="stylesheet" href="css/fontawesome-free/css/all.min.css"
	type="text/css" />
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	type="text/css" />
<!-- icheck bootstrap -->
<asset:link rel="stylesheet"
	href="css/icheck-bootstrap/icheck-bootstrap.min.css" type="text/css" />
<!-- Theme style -->
<asset:link rel="stylesheet" href="css/adminlte.min.css" type="text/css" />
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet" type="text/css" />
<!-- fancybox -->
<asset:link rel="stylesheet" href="css/fancybox/jquery.fancybox.min.css" />

<g:layoutHead />
</head>

<body class="hold-transition sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><g:link
						controller="dashboard" class="nav-link">
						<g:message code="home.label" default="Home" />
					</g:link></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- SEARCH FORM -->
			<form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown user-menu"><a href="#"
					class="nav-link dropdown-toggle" data-toggle="dropdown"> <asset:image
							src="img/user2-160x160.jpg"
							class="user-image img-circle elevation-2" alt="User Image" /> <sec:ifLoggedIn>
							<span class="d-none d-md-inline"><sec:username /></span>
						</sec:ifLoggedIn> <sec:ifNotLoggedIn>
							<span class="d-none d-md-inline"><g:message
									code="default.user.guest" default="Guest" /> </span>
						</sec:ifNotLoggedIn>
				</a>
					<ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<!-- User image -->
						<li class="user-header bg-primary"><asset:image
								src="img/user2-160x160.jpg" class="img-circle elevation-2"
								alt="User Image" />

							<p>
								<sec:ifLoggedIn>
									<sec:username />
								</sec:ifLoggedIn>
								<sec:ifNotLoggedIn>
									<g:message code="default.user.guest" default="Guest" />
								</sec:ifNotLoggedIn>
								<small>Member since Nov. 2012</small>
							</p></li>
						<!-- Menu Footer-->
						<li class="user-footer"> 
							<g:link
								class="btn btn-default btn-flat" controller="logout">
								<g:message code="logout.signout.label" default="Sign out" />
							</g:link>
						</li>
					</ul></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"> <i
						class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->
		<g:layoutBody />

		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> <g:meta name="info.app.version"/>
			</div>
			<strong>03.08.2019 <a href="https://blog.k-oo.de">k-oo.de</a>.
			</strong>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<asset:javascript src="js/jquery/jquery.min.js" />
	<!-- Bootstrap 4 -->
	<asset:javascript src="js/bootstrap/js/bootstrap.bundle.min.js" />
	<!-- FastClick -->
	<asset:javascript src="js/fastclick/fastclick.js" />
	<!-- fancybox -->
	<asset:javascript src="js/fancybox/jquery.fancybox.min.js" />
	<!-- AdminLTE App -->
	<asset:javascript src="js/adminlte.min.js" />

</body>
</html>
