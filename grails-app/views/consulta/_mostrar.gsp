<div class="other-box gray-box ui-corner-all">
	<div class="cont ui-corner-all">
		<div class="paciente">
			<h2><g:message code="pacient.section.title"/></h2>
				<g:if test="${smallPictures == true }">
					<div class="foto_pequena">
						<img src="${resource(dir:'images', file:'no_picture_small.png')}" />
					</div>
				</g:if>
				<g:else>
					<div class="foto">
						<img src="${resource(dir:'images', file:'no_picture.png')}" />
					</div>
				</g:else>
			<div class="dados">
				<g:link controller="paciente" action="mostrar" id="${consultaInstancia?.paciente?.id}">
					<h3>${consultaInstancia?.paciente?.nome}</h3>
				</g:link>
				<div style="padding: 20px 10px;">
					<g:message code="paciente.telefone.label"/>
					${consultaInstancia?.paciente?.telefone} <br/>
					<g:message code="paciente.email.label"/>
					${consultaInstancia?.paciente?.email}<br/>
				</div>
			</div>
		</div>
		<div class="medico">
			<h2><g:message code="doctor.section.title"/> </h2>
				<g:if test="${smallPictures == true }">
					<div class="foto_pequena">
						<img src="${resource(dir:'images', file:'no_picture_doctor_small2.png')}" />
					</div>
				</g:if>
				<g:else>
					<div class="foto">
						<img src="${resource(dir:'images', file:'no_picture_doctor2.png')}" />
					</div>
				</g:else>
			<div class="dados">
				<g:link controller="medico" action="mostrar" id="${consultaInstancia?.paciente?.id}">
					<h3>${consultaInstancia?.medico?.nome}</h3>
				</g:link>
				<div style="padding: 20px 10px;">
					<g:message code="paciente.telefone.label"/>
					${consultaInstancia?.medico?.telefone} <br/>
					<g:message code="paciente.email.label"/>
					${consultaInstancia?.medico?.email}<br/>
				</div>
			</div>
			<div style="float:left;width:20%;padding: 20px 10px;">
<%--								<g:link action="mostrar" controller="agenda" id="${pacienteInstancia.agenda.id}"><g:message code="link.agenda.paciente"/>  </g:link>--%>
<%--								<div><g:message code="paciente.preco.consulta.label"/><g:formatNumber number="${pacienteInstancia.precoConsulta}" type="currency"/></div>--%>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="other-box yellow-box ui-corner-all">  
	<div class="cont ui-corner-all">
		<h3><g:message code="consultation.date.info" /> </h3>
		<g:message code="consultation.status.label"/>
		${fieldValue(bean:consultaInstancia, field:'status')} <br/>
		<b>
			<g:message code="consultation.date.label"/>
			<g:formatDate date="${consultaInstancia?.data}" formatName="consultation.date.format" />
		</b>
	</div>
</div>