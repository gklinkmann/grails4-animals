<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
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
							<g:message code="default.add.label" args="[entityName]" />
						</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><g:link controller="dashboard">
									<g:message code="home.label" default="Home" />
								</g:link></li>
							<li class="breadcrumb-item"><g:link controller="user">
									<g:message code="users.label" default="Users" />
								</g:link></li>
							<li class="breadcrumb-item active"><g:message
									code="user.label" default="User" /></li>
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
								<g:hasErrors bean="${this.user}">
									<ul class="errors" role="alert">
										<g:eachError bean="${this.user}" var="error">
											<li<g:if
													test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
													error="${error}" /></li>
										</g:eachError>
									</ul>
								</g:hasErrors>
								<g:form resource="${this.user}" method="POST">
									<fieldset class="form">
										<f:all bean="user" />
										<div class="form-group row">
											<div class="col-sm-5">
												<label><g:message code="user.authorities.label" default="Authorities"/>:</label>
											</div>
											<div class="form-check col-sm-7">
												<g:each in="${roles}" var="r">
													<g:checkBox name="${r?.authority}" />
													<label class="form-check-label">${r?.authority?.encodeAsHTML()}</label>
													<br />
												</g:each>
											</div>
										</div>
									</fieldset>
									<fieldset class="buttons">
										<g:submitButton name="create" class="btn btn-primary"
											value="${message(code: 'default.button.create.label', default: 'Create')}" />
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
