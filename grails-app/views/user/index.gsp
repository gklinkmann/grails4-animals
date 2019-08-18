<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
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
							<g:message code="default.list.label" args="[entityName]" />
						</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><g:link controller="dashboard">
									<g:message code="home.label" default="Home" />
								</g:link></li>
							<li class="breadcrumb-item active"><g:message
									code="users.label" default="Users" /></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body table-responsive p-3">
								<div class="row">
									<div class="col-sm-12">
										<g:if test="${flash.message}">
											<div class="alert alert-info alert-dismissible">
												<button type="button" class="close" data-dismiss="alert"
													aria-hidden="true">×</button>
												<h5>
													<i class="icon fas fa-info"></i> Info!
												</h5>
												<div class="message" role="status">${flash.message}</div>
											</div>
										</g:if>
										<f:table collection="${userList}" except="password,id" />
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-6"></div>
									<div class="col-sm-12 col-md-6">
										<div class="pagination">
											<g:paginate total="${userCount ?: 0}" />
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
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