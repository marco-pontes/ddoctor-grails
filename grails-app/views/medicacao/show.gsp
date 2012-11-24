<%@ page import="ddoctor.Medicacao" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicacao.label', default: 'Medicacao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medicacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-medicacao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medicacao">
				<g:if test="${medicacaoInstancia?.bula}">
				<li class="fieldcontain">
					<span id="bula-label" class="property-label"><g:message code="medicacao.bula.label" default="Bula" /></span>
						<span class="property-value" aria-labelledby="bula-label"><g:fieldValue bean="${medicacaoInstancia}" field="bula"/></span>
				</li>
				</g:if>
				<g:if test="${medicacaoInstancia?.dataCompra}">
				<li class="fieldcontain">
					<span id="dataCompra-label" class="property-label"><g:message code="medicacao.dataCompra.label" default="Data Compra" /></span>
						<span class="property-value" aria-labelledby="dataCompra-label"><g:formatDate date="${medicacaoInstancia?.dataCompra}" /></span>
				</li>
				</g:if>
				<g:if test="${medicacaoInstancia?.fabricante}">
				<li class="fieldcontain">
					<span id="fabricante-label" class="property-label"><g:message code="medicacao.fabricante.label" default="Fabricante" /></span>
						<span class="property-value" aria-labelledby="fabricante-label"><g:fieldValue bean="${medicacaoInstancia}" field="fabricante"/></span>
				</li>
				</g:if>
				<g:if test="${medicacaoInstancia?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="medicacao.nome.label" default="Nome" /></span>
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${medicacaoInstancia}" field="nome"/></span>
				</li>
				</g:if>
				<g:if test="${medicacaoInstancia?.quantidade}">
				<li class="fieldcontain">
					<span id="quantidade-label" class="property-label"><g:message code="medicacao.quantidade.label" default="Quantidade" /></span>
						<span class="property-value" aria-labelledby="quantidade-label"><g:fieldValue bean="${medicacaoInstancia}" field="quantidade"/></span>
				</li>
				</g:if>
			
				<g:if test="${medicacaoInstancia?.tarja}">
				<li class="fieldcontain">
					<span id="tarja-label" class="property-label"><g:message code="medicacao.tarja.label" default="Tarja" /></span>
						<span class="property-value" aria-labelledby="tarja-label"><g:fieldValue bean="${medicacaoInstancia}" field="tarja"/></span>
				</li>
				</g:if>
				<g:if test="${medicacaoInstancia?.unidade}">
				<li class="fieldcontain">
					<span id="unidade-label" class="property-label"><g:message code="medicacao.unidade.label" default="Unidade" /></span>
					
						<span class="property-value" aria-labelledby="unidade-label"><g:fieldValue bean="${medicacaoInstancia}" field="unidade"/></span>
					
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${medicacaoInstancia?.id}" />
					<g:link class="edit" action="edit" id="${medicacaoInstancia?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
