<%@ page import="ddoctor.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'entrevistaMedica.label', default: 'Consulta')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <r:require modules="entrevista_medica"/>
    </head>
    <body>
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'consultation.enterview.title')}" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="consultation.enterview.welcome.message" /></h2>
						<span><g:message code="consultation.enterview.welcome.hint" /></span>
					</div>
					<div class="clear"></div>
					<div class="content-box">
			            <g:if test="${flash.mensagem}">
			            	<div class="response-msg inf ui-corner-all">
								<span><g:message code="info.box.label" /></span>
								${flash.mensagem}
							</div>
			            </g:if>
			            <g:form class="forms" url="${createLink(action:'salvarEntrevista',controller:'consulta')}?atendimento.id=${params.'atendimento'.'id'.toInteger() }">
						<ul>
                        
							<li>
                                <label for="altura" class="desc">
									<g:message code="entrevistaMedica.altura.label" default="Altura" />
								</label>
								<div>
                                   	<g:textField class='field text small ${hasErrors(bean: entrevistaInstancia, field: 'altura', 'error')}' name="entrevista.altura" value="${entrevistaInstancia?.altura}" />
                              	</div>
                              	<label for="altura" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="altura" />
                              	</label>
							</li>
                        
							<li>
                                <label for="peso" class="desc">
									<g:message code="entrevistaMedica.peso.label" default="Peso" />
								</label>
								<div>
                                   	<g:textField class='field text small ${hasErrors(bean: entrevistaInstancia, field: 'peso', 'error')}' name="entrevista.peso" value="${entrevistaInstancia?.peso}" />
                              	</div>
                              	<label for="altura" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="peso" />
                              	</label>
							</li>
                        
							<li>
                                <label for="pressao" class="desc">
									<g:message code="entrevistaMedica.pressao.label" default="Pressao" />
								</label>
								<div>
                                   	<g:textField class='field text small ${hasErrors(bean: entrevistaInstancia, field: 'pressao', 'error')}' name="entrevista.pressao" value="${entrevistaInstancia?.pressao}" />
                              	</div>
                              	<label for="pressao" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="pressao" />
                              	</label>
							</li>
                        
							<li>
<%--                                <label for="pulso" class="desc">--%>
<%--									<g:message code="entrevistaMedica.pulso.label" default="Pulso" />--%>
<%--								</label>--%>
<%--								<div class="${hasErrors(bean: entrevistaInstancia, field: 'pulso', 'errors')}">--%>
<%--                                   	<g:textField class='field text small' name="pulso" value="${entrevistaInstancia?.pulso}" />--%>
<%--                              	</div>--%>
							</li>
                        
							<li>
                                <label for="problema" class="desc">
									<g:message code="entrevistaMedica.problema.label" default="Problema" />
								</label>
								<div>
                                   	<g:textArea class='field textarea small ${hasErrors(bean: entrevistaInstancia, field: 'problema', 'error')}' name="entrevista.problema" cols="40" rows="5" value="${entrevistaInstancia?.problema}" />
                              	</div>
                              	<label for="problema" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="problema" />
                              	</label>
							</li>
							<li>
                                <label for="medicacao" class="desc">
									<g:message code="entrevistaMedica.medicacao.label" default="Medicacao" />
								</label>
								<div>
                                   	<g:textField class='field text small ${hasErrors(bean: entrevistaInstancia, field: 'medicacao', 'error')}' name="entrevista.medicacao" value="${entrevistaInstancia?.medicacao}" />
                              	</div>
                              	<label for="medicacao" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="medicacao" />
                              	</label>
							</li>
                        
							<li>
                                <label for="observacoes" class="desc">
									<g:message code="entrevistaMedica.observacoes.label" default="Observacoes" />
								</label>
								<div>
                                   	<g:textArea class='field textarea small ${hasErrors(bean: entrevistaInstancia, field: 'observacoes', 'error')}' name="entrevista.observacoes" cols="40" rows="5" value="${entrevistaInstancia?.observacoes}" />
                              	</div>
                              	<label for="observacoes" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="observacoes" />
                              	</label>
							</li>
                        
							<li>
                                <label for="laudoMedico" class="desc">
									<g:message code="entrevistaMedica.laudoMedico.label" default="Laudo Medico" />
								</label>
								<div>
                                   	<g:textArea class='field textarea small ${hasErrors(bean: entrevistaInstancia, field: 'laudoMedico', 'error')}' name="entrevista.laudoMedico" cols="40" rows="5" value="${entrevistaInstancia?.laudoMedico}" />
                              	</div>
                              	<label for="laudoMedico" class="error">
                              		<g:renderErrors bean="${entrevistaInstancia}" field="laudoMedico" />
                              	</label>
							</li>
                        
                        
							<li>
<%--                                <label for="medico" class="desc">--%>
<%--									<g:message code="entrevistaMedica.medico.label" default="Medico" />--%>
<%--								</label>--%>
<%--								<div class="${hasErrors(bean: entrevistaInstancia, field: 'medico', 'error')}">--%>
<%--                                   	<g:select class='field select small' name="medico.id" from="${ddoctor.Medico.list()}" optionKey="id" value="${entrevistaInstancia?.medico?.id}"  />--%>
<%--                              	</div>--%>
<%--							</li>--%>
<%--                        --%>
<%--							<li>--%>
<%--                                <label for="paciente" class="desc">--%>
<%--									<g:message code="entrevistaMedica.paciente.label" default="Paciente" />--%>
<%--								</label>--%>
<%--								<div class="${hasErrors(bean: entrevistaInstancia, field: 'paciente', 'error')}">--%>
<%--                                   	<g:select class='field select small' name="paciente.id" from="${ddoctor.Paciente.list()}" optionKey="id" value="${entrevistaInstancia?.paciente?.id}"  />--%>
<%--                              	</div>--%>
							</li>
                        
			                <li class="buttons">
			                    <g:submitButton name="save" class="ui-state-default ui-corner-all ui-button" value="${message(code: 'button.finish.enterview.label')}" />
			                </li>
		                </ul>
		            </g:form>
		        	</div>
						<g:render template="/templates/sidebar" />
				</div>
			</div>
		</div>		        
    </body>
</html>
