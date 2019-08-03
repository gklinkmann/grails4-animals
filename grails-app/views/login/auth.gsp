<html>
<head>
<meta name="layout" content="blank">
<title><g:message code="login.signin.label" default="Sign In" /></title>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>Grails4</b>Animals</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">
					<g:message code="login.signin.label" default="Sign In" />
				</p>

				<form action='${postUrl}' method='POST' id='loginForm'
					class='cssform' autocomplete='off'>
					<div class="input-group mb-3">
						<g:textField name="username" value="${username}"
							class="form-control"
							placeholder="${message(code: 'user.username.label', default: 'Username')}" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<g:passwordField name="password" class="form-control"
							placeholder="${message(code: 'user.password.label', default: 'Password')}" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<g:checkBox name="${rememberMeParameter}" checked="${hasCookie}" />
								<g:message code="login.remember.me.label" default="Remember me" />
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">
								<g:message code="login.signin.label" default="Sign In" />

							</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<p class="mb-1">
					<g:link controller="auth" action="lost"
						params="[username:j_username]">
						<g:message code="login.forgot.password.label"
							default="I forgot my password" />
					</g:link>
				</p>
				<p class="mb-0">
					<g:link controller="auth" action="signUp">
						<g:message code="login.register.label" default="Register" />
					</g:link>
				</p>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

</body>
</html>