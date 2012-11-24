<%@ page import="ddoctor.Atendimento" %>
<%@ page import="ddoctor.StatusTarefa" %>
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
					<h3 style="display:inline;font-weight: bold;">${tarefaInstancia.nome}</h3>
					<div class="task-text">
						${tarefaInstancia.descricao}
					</div>
					<g:render template="/consulta/mostrar" model="[consultaInstancia:tarefaInstancia.consulta, smallPictures:true]" />
					<div class="buttons-wrapper">
						<g:if test="${tarefaInstancia.status == StatusTarefa.PENDENTE}">
							<g:link class="btn ui-state-default ui-corner-all" style="float:left;" action="mostrar" controller="consulta" id="${tarefaInstancia.consulta.id}" params="['tarefa.id':tarefaInstancia.id]" >
								<span class="ui-icon ui-icon ui-icon-link"></span>
								<g:message code="task.object.details.button"/>
							</g:link>
							
							<g:link class="btn ui-state-default ui-corner-all" onclick="return confirm('${message(code: 'message.confirm.consultation.confirmation')}');" style="float:left;" action="confirmar" controller="consulta" id="${tarefaInstancia.consulta.id}" params="['tarefa.id':tarefaInstancia.id, 'irPara':'dashboard']" >
								<span class="ui-icon ui-icon ui-icon-link"></span>
								<g:message code="button.confirm.consultation.label"/>
							</g:link>
							<g:link class="btn ui-state-default ui-corner-all" onclick="return confirm('${message(code: 'message.cancel.consultation.confirmation')}');" style="float:left;" action="cancelar" controller="consulta" id="${tarefaInstancia.consulta.id}" params="['tarefa.id':tarefaInstancia.id]" >
								<span class="ui-icon ui-icon ui-icon-link"></span>
								<g:message code="button.cancel.consultation.label"/>
							</g:link>
						</g:if>
						<div class="clear"></div>
					</div>
        		</div>
			</div>
		</div>
	</div>	
</div>
