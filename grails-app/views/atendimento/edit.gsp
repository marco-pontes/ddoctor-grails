

<%@ page import="ddoctor.Atendimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atendimento.label', default: 'Atendimento')}" />
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
						
						<g:link class="btn ui-state-default ui-corner-all" action="listar">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.list.label" args="[entityName]" />
						</g:link>
						
						<g:link class="btn ui-state-default ui-corner-all" action="_criar">
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
			            <g:hasErrors bean="${atendimentoInstancia}">
				           	<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${atendimentoInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			            <g:form method="post" class="forms" >
			                <g:hiddenField name="id" value="${atendimentoInstancia?.id}" />
			                <g:hiddenField name="version" value="${atendimentoInstancia?.version}" />
								<ul>
		                        
		                         	<li>
	                               		<label for="status">
									  		<g:message code="atendimento.status.label" default="Status" />
										</label>
		                                <div class="${hasErrors(bean: atendimentoInstancia, field: 'status', 'errors')}">
		                                    <g:textField class='field text small' name="status" value="${atendimentoInstancia?.status}" />
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="horario">
									  		<g:message code="atendimento.horario.label" default="Horario" />
										</label>
		                                <div class="${hasErrors(bean: atendimentoInstancia, field: 'horario', 'errors')}">
		                                    <g:datePicker name="horario" precision="day" value="${atendimentoInstancia?.horario}"  />
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="paciente">
									  		<g:message code="atendimento.paciente.label" default="Paciente" />
										</label>
		                                <div class="${hasErrors(bean: atendimentoInstancia, field: 'paciente', 'errors')}">
		                                    <g:select class='field select small' name="paciente.id" from="${ddoctor.Paciente.list()}" optionKey="id" value="${atendimentoInstancia?.paciente?.id}"  />
		                                </div>
		                            </li>
		                        
			
				                <li class="buttons">
				                    <g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
				                    <g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
				                </li>
			                </ul>
			            </g:form>
					</div>
					<g:render template="/dashboard/sidebar" />
				</div>
			</div>
		</div>
    </body>
</html>
