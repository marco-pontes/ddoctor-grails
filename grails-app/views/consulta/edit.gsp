

<%@ page import="ddoctor.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>        
    	<div id="sub-nav">
			<div class="page-title">
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				<span><a href="#" title="Layout Options">Layout Options</a> > <a href="#" title="Two column layout">Two column layout</a> > This is a breadcrumb example</span>
			</div>
			<g:render template="/dashboard/top_buttons" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2>Welcome to Admintasia 2.1 Live Demonstration</h2>
						<span>You can start building your next user interface with this powerful UI framework !</span>
					</div>
					<div class="clear"></div>
					<div class="content-box"> 
						<div class="clearfix"></div>
						<g:link class="btn ui-state-default ui-corner-all" controller="dashboard" action="index">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.home.label"/>
						</g:link>
						
						<g:link class="btn ui-state-default ui-corner-all" action="list">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.list.label" args="[entityName]" />
						</g:link>
						
						<g:link class="btn ui-state-default ui-corner-all" action="criar">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.new.label" args="[entityName]" />
						</g:link>
				       	<div class="clearfix"></div>
			            <g:if test="${flash.message}">
			            	<div class="response-msg inf ui-corner-all">
								<span><g:message code="info.box.label" /></span>
								${flash.message}
							</div>
			            </g:if>
			            <g:hasErrors bean="${consultaInstancia}">
				           	<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${consultaInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			            <g:form method="post" class="forms" >
			                <g:hiddenField name="id" value="${consultaInstancia?.id}" />
			                <g:hiddenField name="version" value="${consultaInstancia?.version}" />
								<ul>
		                        
		                         	<li>
	                               		<label for="altura">
									  		<g:message code="consulta.altura.label" default="Altura" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'altura', 'errors')}">
		                                    <g:textField name="altura" value="${consultaInstancia?.altura}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="peso">
									  		<g:message code="consulta.peso.label" default="Peso" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'peso', 'errors')}">
		                                    <g:textField name="peso" value="${consultaInstancia?.peso}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="pressao">
									  		<g:message code="consulta.pressao.label" default="Pressao" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'pressao', 'errors')}">
		                                    <g:textField name="pressao" value="${consultaInstancia?.pressao}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="problema">
									  		<g:message code="consulta.problema.label" default="Problema" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'problema', 'errors')}">
		                                    <g:textArea name="problema" cols="40" rows="5" maxlength="500" value="${consultaInstancia?.problema}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="observacoes">
									  		<g:message code="consulta.observacoes.label" default="Observacoes" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'observacoes', 'errors')}">
		                                    <g:textArea name="observacoes" cols="40" rows="5" maxlength="500" value="${consultaInstancia?.observacoes}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="laudoMedico">
									  		<g:message code="consulta.laudoMedico.label" default="Laudo Medico" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'laudoMedico', 'errors')}">
		                                    <g:textArea name="laudoMedico" cols="40" rows="5" maxlength="500" value="${consultaInstancia?.laudoMedico}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="medicacao">
									  		<g:message code="consulta.medicacao.label" default="Medicacao" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'medicacao', 'errors')}">
		                                    <g:textField name="medicacao" value="${consultaInstancia?.medicacao}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="medico">
									  		<g:message code="consulta.medico.label" default="Medico" />
										</label>
		                                <div class="${hasErrors(bean: consultaInstancia, field: 'medico', 'errors')}">
		                                    <g:select id="medico" name="medico.id" from="${ddoctor.Medico.list()}" optionKey="id" required="" value="${consultaInstancia?.medico?.id}" class="many-to-one"/>
		                                </div>
		                            </li>
		                        
			
				                <li class="buttons">
				                    <g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
				                    <g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
				                </li>
			                </ul>
			            </g:form>
					</div>
					<g:if test="${perfil == 'ROLE_MEDICO' }">
						<g:render template="/medico/sidebar" />
					</g:if>
					<g:if test="${perfil == 'ROLE_ATENDENTE' }">
						<g:render template="/atendente/sidebar" />
					</g:if>
					<g:if test="${perfil == 'ROLE_PACIENTE' }">
						<g:render template="/paciente/sidebar" />
					</g:if>
				</div>
			</div>
		</div>
    </body>
</html>
