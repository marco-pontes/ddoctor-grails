
<%@ page import="ddoctor.Mensagem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    
    	<div id="sub-nav">
			<div class="page-title">
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
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
				                            <td valign="top" class="name"><g:message code="mensagem.id.label" default="Id" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: mensagemInstancia, field: "id")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="mensagem.corpo.label" default="Corpo" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: mensagemInstancia, field: "corpo")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="mensagem.tipo.label" default="Tipo" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: mensagemInstancia, field: "tipo")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="mensagem.assunto.label" default="Assunto" /></td>
				                            
				                            <td valign="top" class="value">${fieldValue(bean: mensagemInstancia, field: "assunto")}</td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="mensagem.dataEnvio.label" default="Data Envio" /></td>
				                            
				                            <td valign="top" class="value"><g:formatDate date="${mensagemInstancia?.dataEnvio}" /></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="mensagem.destinatario.label" default="Destinatario" /></td>
				                            
				                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${mensagemInstancia?.destinatario?.id}">${mensagemInstancia?.destinatario?.encodeAsHTML()}</g:link></td>
				                            
				                        </tr>
				                    
				                        <tr>
				                            <td valign="top" class="name"><g:message code="mensagem.remetente.label" default="Remetente" /></td>
				                            
				                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${mensagemInstancia?.remetente?.id}">${mensagemInstancia?.remetente?.encodeAsHTML()}</g:link></td>
				                            
				                        </tr>
				                    
				                    </tbody>
				                </table>
							</div>
						</div>  
						<div class="clear"></div>
		                <g:form>
		                    <g:hiddenField name="id" value="${mensagemInstancia?.id}" />
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
