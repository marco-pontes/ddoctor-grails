<%@ page import="ddoctor.Consulta" %>
<%@ page import="ddoctor.StatusConsulta" %>
<%@ page import="ddoctor.StatusTarefa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <r:require modules="consulta_confirmacao"/>
    </head>
    <body>
    
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'consultation.confirm.title')}" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="consultation.confirm.welcome.message" /></h2>
						<span><g:message code="consultation.confirm.welcome.hint" /></span>
					</div>
					<div class="clear"></div>
					<div class="content-box">
			            <g:if test="${flash.mensagem}">
			            	<div class="response-msg ${flash.mensagem.tipo} ui-corner-all">
								<span><g:message code="${flash.mensagem.tipo}.box.label" /></span>
								${flash.mensagem.texto}
							</div>
			            </g:if>
						<g:render template="/consulta/mostrar" model="[consultaInstancia:consultaInstancia, smallPictures:false]"/>
						<g:if test="${consultaInstancia.status == StatusConsulta.CANCELADA}">
			            	<div class="response-msg error ui-corner-all">
								<span><g:message code="info.box.label" /></span>
								<g:message code="consultation.status.canceled" />
							</div>
			            </g:if>
	                    <g:if test="${tarefaInstancia?.id && tarefaInstancia.status != StatusTarefa.FINALIZADA}">
		                    <ul>
		                    	<li class="buttons">
									<g:link class="btn ui-state-default ui-corner-all" onclick="return confirm('${message(code: 'message.confirm.consultation.confirmation')}');" style="float:left;" action="confirmar" controller="consulta" id="${tarefaInstancia.consulta.id}" params="['tarefa.id':tarefaInstancia.id, 'irPara':'dashboard']" >
										<span class="ui-icon ui-icon ui-icon-link"></span>
										<g:message code="button.confirm.consultation.label"/>
									</g:link>
									<g:link class="btn ui-state-default ui-corner-all" onclick="return confirm('${message(code: 'message.cancel.consultation.confirmation')}');" style="float:left;" action="cancelar" controller="consulta" id="${tarefaInstancia.consulta.id}" params="['tarefa.id':tarefaInstancia.id]" >
										<span class="ui-icon ui-icon ui-icon-link"></span>
										<g:message code="button.cancel.consultation.label"/>
									</g:link>
								</li>
							</ul>
						</g:if>
        			</div>
        			<g:render template="/templates/sidebar" />
        		</div>
        	</div>
        </div>
    </body>
</html>
