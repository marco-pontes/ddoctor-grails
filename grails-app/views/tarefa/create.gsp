

<%@ page import="ddoctor.Tarefa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
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
			            <g:hasErrors bean="${tarefaInstancia}">
				     		<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${tarefaInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			            <g:form action="save" class="forms" >
						<ul>
                        
							<li>
                                <label for="link" class="desc">
									<g:message code="tarefa.link.label" default="Link" />
								</label>
								<div class="${hasErrors(bean: tarefaInstancia, field: 'link', 'errors')}">
                                   	<g:textField name="link" value="${tarefaInstancia?.link}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="dataEnvio" class="desc">
									<g:message code="tarefa.dataCriacao.label" default="Data Envio" />
								</label>
								<div class="${hasErrors(bean: tarefaInstancia, field: 'dataEnvio', 'errors')}">
                                   	<g:datePicker name="dataEnvio" precision="day"  value="${tarefaInstancia?.dataCriacao}"  />
                              	</div>
							</li>
                        
							<li>
                                <label for="descricao" class="desc">
									<g:message code="tarefa.descricao.label" default="Descricao" />
								</label>
								<div class="${hasErrors(bean: tarefaInstancia, field: 'descricao', 'errors')}">
                                   	<g:textField name="descricao" value="${tarefaInstancia?.descricao}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="nome" class="desc">
									<g:message code="tarefa.nome.label" default="Nome" />
								</label>
								<div class="${hasErrors(bean: tarefaInstancia, field: 'nome', 'errors')}">
                                   	<g:textField name="nome" value="${tarefaInstancia?.nome}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="status" class="desc">
									<g:message code="tarefa.status.label" default="Status" />
								</label>
								<div class="${hasErrors(bean: tarefaInstancia, field: 'status', 'errors')}">
                                   	<g:select name="status" from="${ddoctor.StatusTarefa?.values()}" keys="${ddoctor.StatusTarefa.values()*.name()}" required="" value="${tarefaInstancia?.status?.name()}"/>
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
