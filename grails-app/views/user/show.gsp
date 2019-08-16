<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
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
							<g:message code="default.show.label" args="[entityName]" />
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
									<div class="alert alert-info alert-dismissible">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h5>
											<i class="icon fas fa-info"></i> Info!
										</h5>
										<div class="message" role="status">${flash.message}</div>
									</div>
								</g:if>
								<f:display bean="user" except="password" />
								<g:form>
									<fieldset class="form">
										<div class="form-group row">
											<div class="col-sm-5">
												<label><g:message code="user.authorities.label" default="Authorities"/>:</label>
											</div>
											<div class="form-check col-sm-7">
												<g:each in="${roles}" var="r">
													<g:checkBox name="${r?.authority}" value="${r?.authority}" checked="${userRoles.contains(r)}" disabled="disabled"/>
													<label class="form-check-label">${r?.authority?.encodeAsHTML()}</label>
													<br />
												</g:each>
											</div>
										</div>
									</fieldset>
								</g:form>

								<g:form resource="${this.user}" method="DELETE">
									<fieldset class="buttons">
										<g:link class="btn btn-primary" action="edit"
											resource="${this.user}">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link>
										<input class="btn btn-danger float-right" type="submit"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
