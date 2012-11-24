<%@ page import="ddoctor.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="paciente_listar" />    
    </head>
    <body>
    
    
    	<div id="sub-nav">
    		<ddoctor:breadcrumb pagina="${message(code:'pacients.page.title')}" reset="true" />
<%--			<g:render template="/dashboard/top_buttons" />--%>
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="pacient.list.inner.title" /> </h2>
						<span><g:message code="pacient.list.inner.hint" /></span>
					</div>
					<div class="clear"></div>
		            <g:if test="${flash.mensagem}">
		            	<div class="response-msg ${flash.mensagem.'tipo'} ui-corner-all">
							<span><g:message code="${flash.mensagem.'tipo'}.box.label" /></span>
							${flash.mensagem.'texto'}
						</div>
		            </g:if>
		            <g:if test="${pacienteInstanciaList.size() > 0}">
			            <div class="hastable">
							<form name="myform" method="post" action="" class="lista">
								<table class="listagem" id="sort-table"> 
									<thead> 
										<tr>
				                            <g:sortableColumn class="header" property="id" title="${message(code: 'paciente.foto.label')}" />
				                            <g:sortableColumn class="header" property="nome" title="${message(code: 'paciente.nome.label')}" />
				                            <g:sortableColumn class="header" property="email" title="${message(code: 'paciente.email.label')}" />
				                            <g:sortableColumn class="header" property="telefone" title="${message(code: 'paciente.telefone.label')}" />
				                            <g:sortableColumn class="header" property="planoSaude" title="${message(code: 'paciente.dataNascimento.label')}" />
										</tr>
									</thead>
									<tbody>
										<g:each in="${pacienteInstanciaList}" status="i" var="pacienteInstancia"> 
											<tr>
												<td>
													<img src="${resource(dir:'images',file:'no_picture_small.png')}" />
												</td>
												<td>
													<h3>${pacienteInstancia.nome}</h3>
												</td>
												<td>
													${pacienteInstancia.email}
												</td>
												<td>
													${pacienteInstancia.telefone}
												</td>
												<td>
													${pacienteInstancia.planoSaude.nome}
												</td>
											</tr>
										</g:each> 
									</tbody>
								</table>
							</form>
							<ddoctor:paginate total="${pacienteInstanciaTotal}"  />
						</div>
					</g:if>
        			<g:render template="/templates/sidebar" />
        		</div>
        	</div>
        </div>
    </body>
</html>
