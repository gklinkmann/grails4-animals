<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'animal.label', default: 'Animal')}" />
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
							<g:message code="default.create.label" args="[entityName]" />
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
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">

								<div id="create-animal" class="content scaffold-create"
									role="main">
									<g:if test="${flash.message}">
										<div class="message" role="status">${flash.message}</div>
									</g:if>
									<g:hasErrors bean="${this.animal}">
										<ul class="errors" role="alert">
											<g:eachError bean="${this.animal}" var="error">
												<li<g:if
														test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
														error="${error}" /></li>
											</g:eachError>
										</ul>
									</g:hasErrors>
									<g:form resource="${this.animal}" method="POST">
										<fieldset class="form">
											<f:all bean="animal" />
										</fieldset>
										<fieldset class="buttons">
											<g:submitButton name="create" class="save"
												value="${message(code: 'default.button.create.label', default: 'Create')}" />
										</fieldset>
									</g:form>
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
