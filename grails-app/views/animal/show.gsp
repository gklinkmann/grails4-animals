<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="animals" />
<g:set var="entityName"
	value="${message(code: 'animal.label', default: 'Animal')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-animal" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-animal" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<f:display bean="animal"/>
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-weighing-tab"
					data-toggle="tab" href="#nav-weighing" role="tab"
					aria-controls="nav-weighing" aria-selected="true">${message(code: 'weighing.label', default: 'Weighing')}</a> 
				<a class="nav-item nav-link" id="nav-photo-tab" data-toggle="tab"
					href="#nav-photo" role="tab" aria-controls="nav-photo"
					aria-selected="false">${message(code: 'photo.label', default: 'Photo')}</a> 
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-weighing" role="tabpanel"
				aria-labelledby="nav-weighing-tab">...</div>
			<div class="tab-pane fade" id="nav-photo" role="tabpanel"
				aria-labelledby="nav-photo-tab">...</div>
		</div>
		<g:form resource="${this.animal}" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${this.animal}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<input class="delete" type="submit"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
