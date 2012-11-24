<%@ page import="ddoctor.Tarefa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="tarefa_listar" />       
    </head>
    <body>
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'task.list.title')}" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
						<h2>
							<g:message code="task.list.welcome.message"/>
						</h2>
						<span><g:message code="task.list.welcome.hint" /> </span>
					</div>
		            <g:if test="${flash.mensagem}">
		            	<div class="response-msg inf ui-corner-all">
							<span><g:message code="info.box.label" /></span>
							${flash.mensagem}
						</div>
		            </g:if>
		            <g:if test="${tarefaInstanciaList.size() > 0}">
						<div class="hastable">
							<form name="myform" method="post" action="" class="lista">
								<table class="listagem" id="sort-table"> 
									<thead> 
										<tr>
				                            <th>${message(code: 'task.icone.label')}</th>
				                            <g:sortableColumn property="status" title="${message(code: 'task.status.label')}" />
				                            <g:sortableColumn property="nome" title="${message(code: 'task.nome.label')}" />
				                            <g:sortableColumn property="dataEnvio" title="${message(code: 'task.dataCriacao.label')}" />
				                            <th>${message(code: 'task.options.label')}</th>
	                           			</tr>
	                           		</thead>
	                           		<tbody>
										<g:each in="${tarefaInstanciaList}" status="i" var="tarefaInstancia"> 
											<tr>
												<td>
													<img src="${resource(dir:'images',file:'task_small.png')}" />
												</td>
												<td>
													${fieldValue(bean: tarefaInstancia, field: "status")}
												</td>
												<td>
													${fieldValue(bean: tarefaInstancia, field: "nome")}
												</td>
												<td>
													 <g:formatDate date="${tarefaInstancia.dataCriacao}" formatName="task.list.creation.date" />
												</td>
												<td>
													<g:link class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="${message(code:'open.message.button.title') }" url="#" onClick="javascript:abreModalTarefa(event, ${tarefaInstancia.id});">
														<span class="ui-icon i-icon-mail-open"></span>
													</g:link>
												</td>
											</tr>
										</g:each> 
									</tbody>
								</table>
							</form>
							<ddoctor:paginate total="${tarefaInstanciaTotal}"  />
	        			</div>
	        		</g:if>
        			<g:render template="/templates/sidebar" />
        		</div>
        	</div>
        </div>
        <div id="modal_tarefas" title="${message(code:'modal.task.manage.title') }"></div>
    </body>
</html>
