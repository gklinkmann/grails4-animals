<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'animal.label', default: 'Animal')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
							<g:message code="default.edit.label" args="[entityName]" />
						</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><g:link controller="dashboard">
									<g:message code="home.label" default="Home" />
								</g:link></li>
							<li class="breadcrumb-item"><g:link controller="animal">
									<g:message code="animals.label" default="Animals" />
								</g:link></li>
							<li class="breadcrumb-item active"><g:message
									code="animal.label" default="Animal" /></li>
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
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
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
								<g:hasErrors bean="${this.animal}">
									<div class="alert alert-danger alert-dismissible">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h5>
											<i class="icon fas fa-ban"></i> Alert!
										</h5>
										<g:eachError bean="${this.animal}" var="error">
											<li<g:if
													test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
													error="${error}" /></li>
										</g:eachError>
									</div>
								</g:hasErrors>
								<g:form class="form-horizontal" resource="${this.animal}"
									method="PUT">
									<g:hiddenField name="version" value="${this.animal?.version}" />
									<f:all bean="animal"
										except="weighings,photos,createdBy,lastUpdatedBy" />
									<input class="btn btn-primary" type="submit"
										value="${message(code: 'default.button.update.label', default: 'Update')}" />
								</g:form>
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
