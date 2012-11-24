
<%@ page import="ddoctor.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'paciente.show.page.title')}" />
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
						<div class="other-box gray-box float-left width50 ui-corner-all">
							<div class="cont ui-corner-all">
								<h3>${entityName}</h3>
				                <table>
				                    <tbody>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.id.label" default="Id" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "id")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.login.label" default="Login" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "login")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.senha.label" default="Senha" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "senha")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.nome.label" default="Nome" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "nome")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.sexo.label" default="Sexo" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "sexo")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.dataNascimento.label" default="Data Nascimento" /></td>
				                            
				                            <td valign="top" class="value"><g:formatDate date="${pacienteInstancia?.dataNascimento}" /></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.telefone.label" default="Telefone" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "telefone")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.tarefas.label" default="Tarefas" /></td>
				                            
				                            <td valign="top" style="text-align: left;" class="value">
				                                <ul>
				                                <g:each in="${pacienteInstancia.tarefas}" var="t">
				                                    <li><g:link controller="tarefa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
				                                </g:each>
				                                </ul>
				                            </td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.historico.label" default="Historico" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "historico")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.RG.label" default="RG" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "RG")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.ativo.label" default="Ativo" /></td>
				                            
				                            <td valign="top" class="value"><g:formatBoolean boolean="${pacienteInstancia?.ativo}" /></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.contaBloqueada.label" default="Conta Bloqueada" /></td>
				                            
				                            <td valign="top" class="value"><g:formatBoolean boolean="${pacienteInstancia?.contaBloqueada}" /></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.contaExpirada.label" default="Conta Expirada" /></td>
				                            
				                            <td valign="top" class="value"><g:formatBoolean boolean="${pacienteInstancia?.contaExpirada}" /></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.email.label" default="Email" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "email")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.endereco.label" default="Endereco" /></td>
				                            
				                            <td valign="top" class="value"><g:link controller="endereco" action="show" id="${pacienteInstancia?.endereco?.id}">${pacienteInstancia?.endereco?.encodeAsHTML()}</g:link></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.idade.label" default="Idade" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: pacienteInstancia, field: "idade")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.planoSaude.label" default="Plano Saude" /></td>
				                            
				                            <td valign="top" class="value"><g:link controller="planoSaude" action="show" id="${pacienteInstancia?.planoSaude?.id}">${pacienteInstancia?.planoSaude?.encodeAsHTML()}</g:link></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="paciente.senhaExpirada.label" default="Senha Expirada" /></td>
				                            
				                            <td valign="top" class="value"><g:formatBoolean boolean="${pacienteInstancia?.senhaExpirada}" /></td>
				                            
				                        </tr>
				                    
				                    </tbody>
				                </table>
							</div>
						</div>  
						<div class="clear"></div>
		                <g:form>
		                    <g:hiddenField name="id" value="${pacienteInstancia?.id}" />
		                    <ul>
		                    	<li class="buttons">
									<g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
									<g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</li>
							</ul>
		                </g:form>
        			</div>
        		</div>
        	</div>
        </div>
    </body>
</html>
