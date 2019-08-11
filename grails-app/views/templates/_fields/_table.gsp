<table class="table table-bordered table-striped table-hover">
	<thead>
		<tr>
			<g:each in="${domainProperties}" var="p" status="i">
				<g:sortableColumn property="${p.property}" title="${p.label}" />
			</g:each>
		</tr>
	</thead>
	<tbody>
		<g:each in="${collection}" var="bean" status="i">
			<tr>
				<g:each in="${domainProperties}" var="p" status="j">
					<g:if test="${j==0}">
						<td><g:link method="GET" resource="${bean}">
								<g:if
									test="${bean.properties.get(p.name) instanceof java.sql.Timestamp}">
									<g:formatDate format="dd.MM.yyyy H:m"
										date="${bean.properties.get(p.name)}" />
								</g:if>
								<g:else>
									${bean.properties.get(p.name)}
								</g:else>
							</g:link></td>
					</g:if>
					<g:else>
						<td><g:if
								test="${bean.properties.get(p.name) instanceof java.sql.Timestamp}">
								<g:formatDate format="dd.MM.yyyy H:m"
									date="${bean.properties.get(p.name)}" />
							</g:if> <g:else>
									${bean.properties.get(p.name)}
								</g:else></td>
					</g:else>
				</g:each>
			</tr>
		</g:each>
	</tbody>
</table>