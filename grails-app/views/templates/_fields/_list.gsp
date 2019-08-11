<dl>
	<g:each in="${domainProperties}" var="p">
		<dt>
			<g:message code="${domainClass.decapitalizedName}.${p.name}.label"
				default="${p.defaultLabel}" />
			:
		</dt>
		<dd>${body(p)}</dd>
	</g:each>
</dl>
