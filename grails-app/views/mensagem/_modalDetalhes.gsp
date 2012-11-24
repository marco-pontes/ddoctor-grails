<%@ page import="ddoctor.Atendimento" %>
<div id="page-layout">
	<div id="page-content">
		<div id="page-content-wrapper">
			<div class="clear"></div>
			<div class="content-box">
	            <g:if test="${flash.message}">
	            	<div class="response-msg inf ui-corner-all">
						<span><g:message code="info.box.label" /></span>
						${flash.message}
					</div>
	            </g:if>
         			<div class="cont ui-corner-all" style="line-height:1">
					<h3 style="display:inline;font-weight: bold;">${mensagemInstancia.assunto}</h3>
					<div>
						<g:formatDate date="${mensagemInstancia.dataEnvio}" formatName="email.date.format" />  
					</div>
					<div>
						${mensagemInstancia.remetente.nome}
					</div>
					<div class="task-text">
						${mensagemInstancia.corpo}
					</div>
					<div class="buttons-wrapper">
						<g:link class="btn ui-state-default ui-corner-all apagar" url="#" onClick="javascript:apagaEmail(event, ${mensagemInstancia.id})">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="box.email.delete" />
						</g:link>
						<div class="clear"></div>
					</div>
        		</div>
			</div>
		</div>
	</div>	
</div>
