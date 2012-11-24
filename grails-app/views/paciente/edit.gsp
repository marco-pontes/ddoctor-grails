

<%@ page import="ddoctor.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>        
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'paciente.edit.page.title')}" />
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
						
						<g:link class="btn ui-state-default ui-corner-all" action="create">
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
			            <g:hasErrors bean="${pacienteInstancia}">
				           	<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${pacienteInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			            <g:form method="post" class="forms" >
			                <g:hiddenField name="id" value="${pacienteInstancia?.id}" />
			                <g:hiddenField name="version" value="${pacienteInstancia?.version}" />
								<ul>
		                        
		                         	<li>
	                               		<label for="login">
									  		<g:message code="paciente.login.label" default="Login" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'login', 'errors')}">
		                                    <g:textField name="login" required="" value="${pacienteInstancia?.login}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="senha">
									  		<g:message code="paciente.senha.label" default="Senha" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'senha', 'errors')}">
		                                    <g:textField name="senha" required="" value="${pacienteInstancia?.senha}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="nome">
									  		<g:message code="paciente.nome.label" default="Nome" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'nome', 'errors')}">
		                                    <g:textField name="nome" required="" value="${pacienteInstancia?.nome}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="sexo">
									  		<g:message code="paciente.sexo.label" default="Sexo" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'sexo', 'errors')}">
		                                    <g:select name="sexo" from="${pacienteInstancia.constraints.sexo.inList}" required="" value="${pacienteInstancia?.sexo}" valueMessagePrefix="paciente.sexo"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="dataNascimento">
									  		<g:message code="paciente.dataNascimento.label" default="Data Nascimento" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'dataNascimento', 'errors')}">
		                                    <g:datePicker name="dataNascimento" precision="day"  value="${pacienteInstancia?.dataNascimento}" default="none" noSelection="['': '']" />
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="telefone">
									  		<g:message code="paciente.telefone.label" default="Telefone" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'telefone', 'errors')}">
		                                    <g:textField name="telefone" value="${pacienteInstancia?.telefone}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="tarefas">
									  		<g:message code="paciente.tarefas.label" default="Tarefas" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'tarefas', 'errors')}">
		                                    <g:select name="tarefas" from="${ddoctor.Tarefa.list()}" multiple="multiple" optionKey="id" size="5" value="${pacienteInstancia?.tarefas*.id}" class="many-to-many"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="historico">
									  		<g:message code="paciente.historico.label" default="Historico" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'historico', 'errors')}">
		                                    <g:textArea name="historico" cols="40" rows="5" maxlength="1000" value="${pacienteInstancia?.historico}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="RG">
									  		<g:message code="paciente.RG.label" default="RG" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'RG', 'errors')}">
		                                    <g:field type="number" name="RG" required="" value="${fieldValue(bean: pacienteInstancia, field: 'RG')}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="ativo">
									  		<g:message code="paciente.ativo.label" default="Ativo" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'ativo', 'errors')}">
		                                    <g:checkBox name="ativo" value="${pacienteInstancia?.ativo}" />
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="contaBloqueada">
									  		<g:message code="paciente.contaBloqueada.label" default="Conta Bloqueada" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'contaBloqueada', 'errors')}">
		                                    <g:checkBox name="contaBloqueada" value="${pacienteInstancia?.contaBloqueada}" />
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="contaExpirada">
									  		<g:message code="paciente.contaExpirada.label" default="Conta Expirada" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'contaExpirada', 'errors')}">
		                                    <g:checkBox name="contaExpirada" value="${pacienteInstancia?.contaExpirada}" />
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="email">
									  		<g:message code="paciente.email.label" default="Email" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'email', 'errors')}">
		                                    <g:textField name="email" value="${pacienteInstancia?.email}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="endereco">
									  		<g:message code="paciente.endereco.label" default="Endereco" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'endereco', 'errors')}">
		                                    <g:select id="endereco" name="endereco.id" from="${ddoctor.Endereco.list()}" optionKey="id" required="" value="${pacienteInstancia?.endereco?.id}" class="many-to-one"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="idade">
									  		<g:message code="paciente.idade.label" default="Idade" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'idade', 'errors')}">
		                                    <g:field type="number" name="idade" required="" value="${fieldValue(bean: pacienteInstancia, field: 'idade')}"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="planoSaude">
									  		<g:message code="paciente.planoSaude.label" default="Plano Saude" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'planoSaude', 'errors')}">
		                                    <g:select id="planoSaude" name="planoSaude.id" from="${ddoctor.PlanoSaude.list()}" optionKey="id" required="" value="${pacienteInstancia?.planoSaude?.id}" class="many-to-one"/>
		                                </div>
		                            </li>
		                        
		                         	<li>
	                               		<label for="senhaExpirada">
									  		<g:message code="paciente.senhaExpirada.label" default="Senha Expirada" />
										</label>
		                                <div class="${hasErrors(bean: pacienteInstancia, field: 'senhaExpirada', 'errors')}">
		                                    <g:checkBox name="senhaExpirada" value="${pacienteInstancia?.senhaExpirada}" />
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
