<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'weighing.label', default: 'Weighing')}" />
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
							<li class="breadcrumb-item"><g:link controller="animal" action="show" id="${weighing.animal.id}">
									<g:message code="animal.label" default="Animal" />
								</g:link></li>
							<li class="breadcrumb-item active"><g:message
									code="weighing.label" default="Weighing" /></li>
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
									<div class="message" role="status">${flash.message}</div>
								</g:if>
								<g:hasErrors bean="${this.weighing}">
									<ul class="errors" role="alert">
										<g:eachError bean="${this.weighing}" var="error">
											<li<g:if
													test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
													error="${error}" /></li>
										</g:eachError>
									</ul>
								</g:hasErrors>
								<g:form resource="${this.weighing}" method="PUT">
									<g:hiddenField name="version" value="${this.weighing?.version}" />
									<fieldset class="form">
										<f:all bean="weighing" except="createdBy,lastUpdatedBy"/>
									</fieldset>
									<fieldset class="buttons">
										<input class="btn btn-primary" type="submit"
											value="${message(code: 'default.button.update.label', default: 'Update')}" />
									</fieldset>
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
