<%@ page import="ddoctor.Medicacao" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medicacao.label', default: 'Medicacao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medicacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medicacao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="bula" title="${message(code: 'medicacao.bula.label', default: 'Bula')}" />
						<g:sortableColumn property="dataCompra" title="${message(code: 'medicacao.dataCompra.label', default: 'Data Compra')}" />
						<g:sortableColumn property="fabricante" title="${message(code: 'medicacao.fabricante.label', default: 'Fabricante')}" />
						<g:sortableColumn property="nome" title="${message(code: 'medicacao.nome.label', default: 'Nome')}" />
						<g:sortableColumn property="quantidade" title="${message(code: 'medicacao.quantidade.label', default: 'Quantidade')}" />
						<g:sortableColumn property="tarja" title="${message(code: 'medicacao.tarja.label', default: 'Tarja')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicacaoInstanciaList}" status="i" var="medicacaoInstancia">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${medicacaoInstancia.id}">${fieldValue(bean: medicacaoInstancia, field: "bula")}</g:link></td>
						<td><g:formatDate date="${medicacaoInstancia.dataCompra}" /></td>
						<td>${fieldValue(bean: medicacaoInstancia, field: "fabricante")}</td>
						<td>${fieldValue(bean: medicacaoInstancia, field: "nome")}</td>
						<td>${fieldValue(bean: medicacaoInstancia, field: "quantidade")}</td>
						<td>${fieldValue(bean: medicacaoInstancia, field: "tarja")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicacaoInstanciaTotal}" />
			</div>
		</div>
	</body>
</html>