
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="../../index3.html" class="brand-link"> <asset:image
			src="img/AdminLTELogo.png" alt="AdminLTE Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8" /> <span
		class="brand-text font-weight-light">Animals</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item"><g:link controller="dashboard"
						class="nav-link">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							<g:message code="dashboard.label" default="Dashboard" />
						</p>
					</g:link></li>
				<li class="nav-item has-treeview menu-open"><a href="#"
					class="nav-link active"> <i class="nav-icon fas fa-paw"></i>
						<p>
							<g:message code="animals.label" default="Animals" />
							<i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><g:link controller="animal"
								class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>
									<g:message code="default.list.label" args="${['']}"
										default="List" />
								</p>
							</g:link></li>
						<li class="nav-item"><g:link controller="animal"
								action="create" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>
									<g:message code="default.add.label" args="${['']}"
										default="Create" />
								</p>
							</g:link></li>
					</ul></li>
				<sec:access expression="hasRole('ROLE_ADMIN')">

					<li class="nav-item has-treeview menu-open"><a href="#"
						class="nav-link"> <i class="nav-icon fas fa-users"></i>
							<p>
								<g:message code="users.label" default="Users" />
								<i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><g:link controller="animal"
									class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>
										<g:message code="default.list.label" args="${['']}"
											default="List" />
									</p>
								</g:link></li>
							<li class="nav-item"><g:link controller="animal"
									action="create" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>
										<g:message code="default.add.label" args="${['']}"
											default="Create" />
									</p>
								</g:link></li>
						</ul></li>
				</sec:access>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
