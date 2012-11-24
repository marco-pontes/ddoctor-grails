<g:if test="${atendimentosAguardandoChegada.size() > 0}">
	<table >
		<thead>
			<tr>
				<td><input type="checkbox" class="checkbox" value="" /></td>
				<td><g:message code="consultation.list.pacient.label" /></td>
				<td><g:message code="consultation.list.data.label" /></td>
				<td><g:message code="consultation.list.status.label" /></td>
				<td><g:message code="consultation.list.options.label" /></td>
			</tr>
		</thead>
		<tbody>
			<g:each in="${atendimentosAguardandoChegada}" status="i" var="atendimento" >
				<tr class="${ (i%2 == 0) ? '' : 'alt' }">  	  	
					<td>
						<input type="checkbox" class="checkbox" value=""/>
					</td>
					<td>
						${atendimento.paciente.nome} 
					</td>
					<td>
						<g:formatDate date="${atendimento.consulta.data}" formatName="consulta.data.dashboard.medico" /> 
					</td>
					<td>
						${fieldValue(bean: atendimento, field: "status")}  
					</td>
					<td>
						<a class="btn ui-state-default ui-corner-all" href="javascript: confirmaChegada(${atendimento.id});">
							<span class="ui-icon ui-icon ui-icon-gripsmall-diagonal-se"></span>
							<g:message code="button.confirm.arrival"/>
						</a>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	</g:if>	
	<g:else>
	<div class="content-box-wrapper">
		<h4 style="border-bottom:none;"><g:message code="nenhuma.consulta.message" /></h4>
	</div>
	</g:else>