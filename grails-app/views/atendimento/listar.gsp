
<%@ page import="ddoctor.Atendimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atendimento.label', default: 'Atendimento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require modules="atendimento_listar"/>
    </head>
    <body>
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'consultation.list.title')}" reset="true" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="consultation.list.inner.title" /> </h2>
						<span><g:message code="consultation.list.inner.hint" /></span>
					</div>
		            <g:if test="${flash.mensagem}">
		            	<div class="response-msg ${flash.mensagem.'tipo'} ui-corner-all">
							<span><g:message code="${flash.mensagem.'tipo'}.box.label" /></span>
							${flash.mensagem.'texto'}
						</div>
		            </g:if>
		            <g:if test="${atendimentoInstanciaList.size() > 0}">
                        <div class="hastable">
							<form name="myform" method="post" action="" class="lista">
								<table class="listagem" id="sort-table"> 
									<thead> 
										<tr>
				                            <g:sortableColumn property="id" title="${message(code: 'atendimento.numero.label')}" />
				                            <g:sortableColumn property="status" title="${message(code: 'atendimento.status.label')}" />
				                            <g:sortableColumn property="data" title="${message(code: 'atendimento.horario.label')}" />
				                            <th><g:message code="atendimento.paciente.label" /></th>
				                            <th><g:message code="atendimento.medico.label"/></th>
	                           			</tr>
	                           		</thead>
	                           		<tbody>
										<g:each in="${atendimentoInstanciaList}" status="i" var="atendimentoInstancia"> 
											<tr>
												<td>
													<g:link action="mostrar" id="${atendimentoInstancia.id}">
														<img src="${resource(dir:'images',file:'pen_paper_icon_small.png')}" />
														${atendimentoInstancia.id}
													</g:link>
												</td>
												<td>
													<h3>${fieldValue(bean: atendimentoInstancia, field: "status")}</h3>
												</td>
												<td>
													<g:if test="${atendimentoInstancia.data != null}">
														<g:formatDate date="${atendimentoInstancia.data}" formatName="default.date.day.format"/>
													</g:if>
													<g:else>
														<g:message code="nao.atendido.label" />
													</g:else>
												</td>
												<td>
													<g:link action="mostrar" controller="paciente" id="${atendimentoInstancia.paciente.id}">${fieldValue(bean: atendimentoInstancia.paciente, field: "nome")} </g:link>
												</td>
												<td>
													<g:link action="mostrar" controller="medico" id="${atendimentoInstancia.consulta.medico.id}">${fieldValue(bean: atendimentoInstancia.consulta.medico, field: "nome")} </g:link>
												</td>
											</tr>
										</g:each> 
									</tbody>
								</table>
							</form>
							<ddoctor:paginate total="${atendimentoInstanciaTotal}"  />
        				</div>
        			</g:if>
       			</div>
       			<g:render template="/templates/sidebar" />
       		</div>
       	</div>
    </body>
</html>
