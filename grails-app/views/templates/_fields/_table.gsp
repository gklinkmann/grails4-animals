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
								<f:display bean="${bean}" property="${p.property}" />
							</g:link>
						</td>
					</g:if>
					<g:else>
						<td><f:display bean="${bean}" property="${p.property}" /></td>
					</g:else>
				</g:each>
			</tr>
		</g:each>
	</tbody>
</table>