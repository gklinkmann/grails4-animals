<table class="table table-bordered table-striped table-hover">
	<thead>
		<tr>
			<g:each in="${domainProperties}" var="p" status="i">
				<th>${p.label}</th>
			</g:each>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${collection}" var="bean" status="i">
			<tr>
				<g:each in="${domainProperties}" var="p" status="j">
					<g:if test="${j==0}">
						<td><g:link method="GET" resource="${bean}" action="edit">
								<g:if
									test="${bean.properties.get(p.name) instanceof java.sql.Timestamp}">
									<g:formatDate format="dd.MM.yyyy"
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
								<g:formatDate format="dd.MM.yyyy"
									date="${bean.properties.get(p.name)}" />
							</g:if> <g:else>
									${bean.properties.get(p.name)}
								</g:else></td>
					</g:else>
				</g:each>
				<td><g:form resource="${bean}" method="DELETE">
						<button class="btn btn-default btn-sm" type="submit" >
							<i class="fas fa-trash" ></i>
						</button>
					</g:form></td>
			</tr>
		</g:each>
	</tbody>
</table>