

<%@ page import="ddoctor.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'paciente.create.page.title')}" />
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
			            <g:hasErrors bean="${pacienteInstancia}">
				     		<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${pacienteInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			            <g:form action="save" class="forms" >
						<ul>
                        
							<li>
                                <label for="login" class="desc">
									<g:message code="paciente.login.label" default="Login" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'login', 'errors')}">
                                   	<g:textField name="login" required="" value="${pacienteInstancia?.login}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="senha" class="desc">
									<g:message code="paciente.senha.label" default="Senha" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'senha', 'errors')}">
                                   	<g:textField name="senha" required="" value="${pacienteInstancia?.senha}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="nome" class="desc">
									<g:message code="paciente.nome.label" default="Nome" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'nome', 'errors')}">
                                   	<g:textField name="nome" required="" value="${pacienteInstancia?.nome}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="sexo" class="desc">
									<g:message code="paciente.sexo.label" default="Sexo" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'sexo', 'errors')}">
                                   	<g:select name="sexo" from="${pacienteInstancia.constraints.sexo.inList}" required="" value="${pacienteInstancia?.sexo}" valueMessagePrefix="paciente.sexo"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="dataNascimento" class="desc">
									<g:message code="paciente.dataNascimento.label" default="Data Nascimento" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'dataNascimento', 'errors')}">
                                   	<g:datePicker name="dataNascimento" precision="day"  value="${pacienteInstancia?.dataNascimento}" default="none" noSelection="['': '']" />
                              	</div>
							</li>
                        
							<li>
                                <label for="telefone" class="desc">
									<g:message code="paciente.telefone.label" default="Telefone" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'telefone', 'errors')}">
                                   	<g:textField name="telefone" value="${pacienteInstancia?.telefone}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="historico" class="desc">
									<g:message code="paciente.historico.label" default="Historico" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'historico', 'errors')}">
                                   	<g:textArea name="historico" cols="40" rows="5" maxlength="1000" value="${pacienteInstancia?.historico}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="RG" class="desc">
									<g:message code="paciente.RG.label" default="RG" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'RG', 'errors')}">
                                   	<g:field type="number" name="RG" required="" value="${fieldValue(bean: pacienteInstancia, field: 'RG')}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="ativo" class="desc">
									<g:message code="paciente.ativo.label" default="Ativo" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'ativo', 'errors')}">
                                   	<g:checkBox name="ativo" value="${pacienteInstancia?.ativo}" />
                              	</div>
							</li>
                        
							<li>
                                <label for="contaBloqueada" class="desc">
									<g:message code="paciente.contaBloqueada.label" default="Conta Bloqueada" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'contaBloqueada', 'errors')}">
                                   	<g:checkBox name="contaBloqueada" value="${pacienteInstancia?.contaBloqueada}" />
                              	</div>
							</li>
                        
							<li>
                                <label for="contaExpirada" class="desc">
									<g:message code="paciente.contaExpirada.label" default="Conta Expirada" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'contaExpirada', 'errors')}">
                                   	<g:checkBox name="contaExpirada" value="${pacienteInstancia?.contaExpirada}" />
                              	</div>
							</li>
                        
							<li>
                                <label for="email" class="desc">
									<g:message code="paciente.email.label" default="Email" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'email', 'errors')}">
                                   	<g:textField name="email" value="${pacienteInstancia?.email}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="endereco" class="desc">
									<g:message code="paciente.endereco.label" default="Endereco" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'endereco', 'errors')}">
                                   	<g:select id="endereco" name="endereco.id" from="${ddoctor.Endereco.list()}" optionKey="id" required="" value="${pacienteInstancia?.endereco?.id}" class="many-to-one"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="idade" class="desc">
									<g:message code="paciente.idade.label" default="Idade" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'idade', 'errors')}">
                                   	<g:field type="number" name="idade" required="" value="${fieldValue(bean: pacienteInstancia, field: 'idade')}"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="planoSaude" class="desc">
									<g:message code="paciente.planoSaude.label" default="Plano Saude" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'planoSaude', 'errors')}">
                                   	<g:select id="planoSaude" name="planoSaude.id" from="${ddoctor.PlanoSaude.list()}" optionKey="id" required="" value="${pacienteInstancia?.planoSaude?.id}" class="many-to-one"/>
                              	</div>
							</li>
                        
							<li>
                                <label for="senhaExpirada" class="desc">
									<g:message code="paciente.senhaExpirada.label" default="Senha Expirada" />
								</label>
								<div class="${hasErrors(bean: pacienteInstancia, field: 'senhaExpirada', 'errors')}">
                                   	<g:checkBox name="senhaExpirada" value="${pacienteInstancia?.senhaExpirada}" />
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
