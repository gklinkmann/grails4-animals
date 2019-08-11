<div class="form-group row">
	<label for="${property}" class="col-sm-5 control-label">
		<g:message code="${property}.label" default="${label}" />
		<g:if test="${required}">*</g:if>:
	</label>
	<div class="col-sm-7">
		<f:widget property="${property}"/>
	</div>
</div>
<!-- .form-group row -->
