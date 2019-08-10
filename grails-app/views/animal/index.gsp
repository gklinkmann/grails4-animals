<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'animal.label', default: 'Animal')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<asset:link href="css/animals.css" rel="stylesheet" type="text/css" />
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
							<small>Administration</small>
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
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">
									<g:message code="default.list.label" args="[entityName]" />
								</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">

								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>
								<div class="row">
									<div class="col-sm-12">
										<f:table collection="${animalList}" />
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-6">
									</div>
									<div class="col-sm-12 col-md-6">
										<div class="pagination">
											<g:paginate
												total="${animalCount ?: 0}" maxsteps="3" />
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
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
	</script>
</body>
</html>