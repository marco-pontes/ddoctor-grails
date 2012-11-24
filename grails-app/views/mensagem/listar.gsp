<%@ page import="ddoctor.Mensagem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="mensagem_listar" />
    </head>
    <body>
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'consultation.list.title')}" reset="true" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="messages.list.inner.title" /> </h2>
						<span><g:message code="messages.list.inner.hint" /></span>
					</div>
					<div class="content-box">
				 		<div class="clearfix"></div>
			            <g:if test="${flash.mensagem}">
			            	<div class="response-msg ${flash.mensagem.'tipo'} ui-corner-all">
								<span><g:message code="${flash.mensagem.'tipo'}.box.label" /></span>
								${flash.mensagem.'texto'}
							</div>
			            </g:if>
	            
						<g:if test="${mensagemInstanciaList.size() > 0}">
							<div class="hastable">
								<form name="myform" class="pager-form" method="post" action="">
									<table id="sort-table"> 
										<thead> 
										<tr>
				                            <g:sortableColumn property="corpo" title="${message(code: 'mensagem.corpo.label', default: 'Corpo')}" />
				                            <g:sortableColumn property="assunto" title="${message(code: 'mensagem.assunto.label', default: 'Assunto')}" />
				                            <g:sortableColumn property="dataEnvio" title="${message(code: 'mensagem.dataEnvio.label', default: 'Data Envio')}" />
											<th style="width:64px">Options</th> 
										</tr> 
										</thead> 
										<tbody>
											<g:each in="${mensagemInstanciaList}" status="i" var="mensagemInstancia"> 
												<tr>
							                            <td>${fieldValue(bean: mensagemInstancia, field: "corpo")}</td>
							                            <td>${fieldValue(bean: mensagemInstancia, field: "assunto")}</td>
							                            <td><g:formatDate date="${mensagemInstancia.dataEnvio}" formatName="email.date.format" /></td>
							                    	<td>
														<g:link class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="${message(code:'open.message.button.title') }" url="#" onClick="javascript:abreModalMensagens(event, ${mensagemInstancia.id});">
															<span class="ui-icon i-icon-mail-open"></span>
														</g:link>
														<g:link class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="${message(code:'delete.message.button.title') }" url="#" onClick="javascript:apagaEmail(event, ${mensagemInstancia.id});">
															<span class="ui-icon ui-icon-trash"></span>
														</g:link>
													</td>
												</tr>
											</g:each>
										</tbody>
									</table>
								</form>
								<ddoctor:paginate total="${totalInstanciasMensagem}" />
	        				</div>
						</g:if>
        				<g:render template="/templates/sidebar" />
        			</div>
        		</div>
        	</div>
        </div>
	    <div id="modal_mensagens" title="${message(code:'modal.emails.manage.title') }"></div>
    </body>
</html>
