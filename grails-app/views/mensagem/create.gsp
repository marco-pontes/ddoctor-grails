

<%@ page import="ddoctor.Mensagem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div id="sub-nav">
			<div class="page-title">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
						
						<g:link class="btn ui-state-default ui-corner-all" action="listar">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.list.label" args="[entityName]" />
						</g:link>
						<div class="clearfix"></div>						
			            <g:if test="${flash.message}">
			            	<div class="response-msg inf ui-corner-all">
								<span><g:message code="info.box.label" /></span>
								${flash.message}
							</div>
			            </g:if>
			            <g:hasErrors bean="${mensagemInstancia}">
				     		<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${mensagemInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			            <g:form action="save" class="forms" >
						<ul>
                        
							<li>
                                <label for="corpo" class="desc">
									<g:message code="mensagem.corpo.label" default="Corpo" />
								</label>
								<div class="${hasErrors(bean: mensagemInstancia, field: 'corpo', 'errors')}">
                                   	<g:textArea name="corpo" cols="40" rows="5" maxlength="500" value="${mensagemInstancia?.corpo}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="tipo" class="desc">
									<g:message code="mensagem.tipo.label" default="Tipo" />
								</label>
								<div class="${hasErrors(bean: mensagemInstancia, field: 'tipo', 'errors')}">
                                   	<g:textField name="tipo" value="${mensagemInstancia?.tipo}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="assunto" class="desc">
									<g:message code="mensagem.assunto.label" default="Assunto" />
								</label>
								<div class="${hasErrors(bean: mensagemInstancia, field: 'assunto', 'errors')}">
                                   	<g:textField name="assunto" value="${mensagemInstancia?.assunto}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="dataEnvio" class="desc">
									<g:message code="mensagem.dataEnvio.label" default="Data Envio" />
								</label>
								<div class="${hasErrors(bean: mensagemInstancia, field: 'dataEnvio', 'errors')}">
                                   	<g:datePicker name="dataEnvio" precision="day"  value="${mensagemInstancia?.dataEnvio}"  />
                              	</div>
							</li>
                        
							<li>
                                <label for="destinatario" class="desc">
									<g:message code="mensagem.destinatario.label" default="Destinatario" />
								</label>
								<div class="${hasErrors(bean: mensagemInstancia, field: 'destinatario', 'errors')}">
                                   	<g:select id="destinatario" name="destinatario.id" from="${ddoctor.usuario.Usuario.list()}" optionKey="id" required="" value="${mensagemInstancia?.destinatario?.id}" class="many-to-one"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="remetente" class="desc">
									<g:message code="mensagem.remetente.label" default="Remetente" />
								</label>
								<div class="${hasErrors(bean: mensagemInstancia, field: 'remetente', 'errors')}">
                                   	<g:select id="remetente" name="remetente.id" from="${ddoctor.usuario.Usuario.list()}" optionKey="id" required="" value="${mensagemInstancia?.remetente?.id}" class="many-to-one"/>
                              	</div>
							</li>
                        
			                <li class="buttons">
			                    <g:submitButton name="create" class="ui-state-default ui-corner-all ui-button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
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
