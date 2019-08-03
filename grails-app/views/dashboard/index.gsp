<!DOCTYPE html>
<html>
<head>
<title><g:message code="default.list.label" args="[entityName]" /></title>
<meta name="layout" content="adminLTE" />
</head>
<body>
	<g:render template="menu" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>
							<g:message code="animals.label" default="Animals" />
							<small>Dashboard</small>
						</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#"><g:message
										code="home.label" default="Home" /></a></li>
							<li class="breadcrumb-item active"><g:message
									code="animals.label" default="Animals" /></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3>${animalInstanceTotal}</h3>

								<p>
									<g:message code="animals.label" default="Animals" />
								</p>
							</div>
							<div class="icon">
								<i class="ion ion-bug"></i>
							</div>
							<g:link controller="animal"
								class="small-box-footer"> More info <i
								class="fas fa-arrow-circle-right"></i>
							</g:link>
						</div>
					</div>
					<!-- ./col -->
					<sec:access expression="hasRole('ROLE_ADMIN')">
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-warning">
							<div class="inner">
								<h3>${userInstanceTotal}</h3>

								<p><g:message code="users.label" default="Users" /></p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<g:link controller="user"
								class="small-box-footer"> More info <i
								class="fas fa-arrow-circle-right"></i>
							</g:link>
						</div>
					</div>
					</sec:access>
					<!-- ./col -->
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>
