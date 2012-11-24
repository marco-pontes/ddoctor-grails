º<%@ page import="ddoctor.Medico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'medico.label', default: 'Medico')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="medico_listar" />      
    </head>
    <body>
    	<div id="sub-nav">
    		<ddoctor:breadcrumb pagina="${message(code:'medicos.page.title')}" reset="true" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="doctor.list.inner.title" /> </h2>
						<span><g:message code="doctor.list.inner.hint" /></span>
					</div>
		            <g:if test="${flash.mensagem}">
		            	<div class="response-msg ${flash.mensagem.'tipo'} ui-corner-all">
							<span><g:message code="${flash.mensagem.'tipo'}.box.label" /></span>
							${flash.mensagem.'texto'}
						</div>
		            </g:if>
		            <g:if test="${medicoInstanciaList.size() > 0}">
						<div class="hastable">
							<form name="myform" method="post" action="" class="lista">
								<table class="listagem" id="sort-table"> 
									<thead> 
										<tr>
				                            <th>${message(code: 'medico.foto.label')}</th>
				                            <g:sortableColumn property="nome" title="${message(code: 'medico.nome.label')}" />
				                            <g:sortableColumn property="telefone" title="${message(code: 'medico.telefone.label')}"/>
				                            <g:sortableColumn property="email" title="${message(code: 'medico.email.label')}"/>
				                            <g:sortableColumn property="precoConsulta" title="${message(code: 'medico.precoConsulta.label')}" />
	                           				<th>${message(code: 'medico.agenda.label')}</th>
	                           			</tr>
	                           		</thead>
	                           		<tbody>
										<g:each in="${medicoInstanciaList}" status="i" var="medicoInstancia"> 
											<tr>
												<td>
													<img src="${resource(dir:'images',file:'no_picture_doctor_small2.png')}" />
												</td>
												<td>
													<h3>${medicoInstancia.nome}</h3>
													<div class="tooltip" style="color: #1A4A85; cursor: default;" title="${medicoInstancia.especialidade.descricao}">${medicoInstancia.especialidade.nome}</div>
												</td>
												<td>
													${medicoInstancia.telefone} <br/>
												</td>
												<td>
													${medicoInstancia.email}<br/>
												</td>
												<td>
													<div><g:message code="medico.preco.consulta.label"/><g:formatNumber number="${medicoInstancia.precoConsulta}" type="currency"/></div>
												</td>
												<td>
													<g:link class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="${message(code:'open.agenda.button.title') }" url="#"  onClick="javascript:abreModalAgenda(event, ${medicoInstancia.id})">
														<span class="ui-icon i-icon-mail-open"></span>
													</g:link>
												</td>
											</tr>
										</g:each> 
									</tbody>
								</table>
							</form>
							<ddoctor:paginate total="${medicoInstanciaTotal}"  />
						</div>
					</g:if>
        			<g:render template="/templates/sidebar" />
        		</div>
        	</div>
        </div>
    </body>
</html>
