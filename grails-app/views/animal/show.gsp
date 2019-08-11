<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="adminLTE" />
<g:set var="entityName"
	value="${message(code: 'animal.label', default: 'Animal')}" />
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
								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>
								<f:display bean="animal" except="weighings,photos,createdBy" />
							</div>
							<!-- /.card-body -->
							<div class="card-footer clearfix">
								<g:form resource="${this.animal}" method="DELETE">
									<fieldset class="buttons">
										<g:link class="btn btn-primary" action="edit" resource="${this.animal}">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link>
										<input class="btn btn-danger float-right" type="submit"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</fieldset>
								</g:form>
							</div>
							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<nav>
									<div class="nav nav-tabs" id="nav-tab" role="tablist">
										<a class="nav-item nav-link active" id="nav-weighing-tab"
											data-toggle="tab" href="#nav-weighing"> ${message(code:
											'weighing.label', default: 'Weighing')} </a> <a
											class="nav-item nav-link" id="nav-photo-tab"
											data-toggle="tab" href="#nav-photo"> ${message(code:
											'photo.label', default: 'Photo')} </a>
									</div>
								</nav>
								<div class="tab-content" id="nav-tabContent">
									<div class="tab-pane fade show active" id="nav-weighing"
										role="tabpanel" aria-labelledby="nav-weighing-tab">
										</p>
										<f:table collection="${animal.weighings}"
											except="animal,dateCreated,lastUpdated,createdBy,id" />
									</div>
									<div class="tab-pane fade" id="nav-photo" role="tabpanel"
										aria-labelledby="nav-photo-tab">
										</p>
										<f:table collection="${animal.photos}"
											except="animal,dateCreated,lastUpdated,createdBy,id" />
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
