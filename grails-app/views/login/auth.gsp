<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="blank">
<title><g:message code="login.signin.label" default="Sign In" /></title>
</head>
<body>
	<div class="form-box" id="login-box">
		<div class="header"><g:message code="login.signin.label" default="Sign In" /></div>
		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<div class="body bg-gray">
				<div class="form-group">
                	<g:textField name="username" value="${username}"  class="form-control"
						placeholder="${message(code: 'user.username.label', default: 'Username')}"/>
   				</div>
				<div class="form-group">
					<g:passwordField name="password"  class="form-control"
						placeholder="${message(code: 'user.password.label', default: 'Password')}"/>
				</div>
				<div class="form-group">
					<g:checkBox name="${rememberMeParameter}" checked="${hasCookie}" /> <g:message code="login.remember.me.label" default="Remember me" />
				</div>
			</div>
			<div class="footer">
				<button type="submit" name="signIn" class="btn bg-olive btn-block">
					<g:message code="login.signin.label" default="Sign In" />
				</button>

				<p>
					<g:link controller="auth" action="lost" params="[username:j_username]">
						<g:message code="login.forgot.password.label" default="I forgot my password" />
					</g:link>
				</p>

				<g:link controller="auth" action="signUp"><g:message code="login.register.label" default="Register" /></g:link>
			</div>
		</form>
	</div>
</body>
</html>