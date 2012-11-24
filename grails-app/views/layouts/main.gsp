<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><g:layoutTitle default="Admintasia v2" />
	</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%--	<link rel="stylesheet" href="${resource(dir:'css/ui',file:'ui.base.css')}" media="all" />--%>
	
	
	
	<%--<link rel="stylesheet" href="${resource(dir:'css/themes/blueberry',file:'ui.css')}" media="all" />--%>
	<%--<link rel="stylesheet" href="${resource(dir:'css/themes/blueberry',file:'ui.css')}" title="style" media="all" />--%>
<%--	<link rel="stylesheet" href="${resource(dir:'css/themes/black_rose',file:'ui.css')}" media="all" />--%>
	<%--<link rel="stylesheet" href="${resource(dir:'css/themes/black_rose',file:'ui.css')}" title="style" media="all" />--%>
<%--	<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />--%>
<%--	<link rel="stylesheet" href="${resource(dir:'css',file:'fullcalendar.css')}" />--%>
<%--	<g:javascript library="jquery-1.4.2" />--%>
<%--	<g:javascript library="ui/ui.core" />--%>
<%--	<g:javascript library="ui/ui.widget" />--%>
<%--	<g:javascript library="ui/ui.mouse" />--%>
<%--	<g:javascript library="superfish" />--%>
<%--	<g:javascript library="live_search" />--%>
<%--	<g:javascript library="tooltip" />--%>
<%--	<g:javascript library="cookie" />--%>
<%--	<g:javascript library="ui/ui.sortable" />--%>
<%--	<g:javascript library="ui/ui.draggable" />--%>
<%--	<g:javascript library="ui/ui.resizable" />--%>
<%--	<g:javascript library="ui/ui.position" />--%>
<%--	<g:javascript library="ui/ui.button" />--%>
<%--	<g:javascript library="ui/ui.dialog" />--%>
<%--	<g:javascript library="ui/ui.datepicker" />--%>
<%--	<g:javascript library="ui/I18N/jquery.ui.datepicker-pt-BR" />--%>
<%--	<g:javascript library="ui/fullcalendar.min" />--%>
<%--	<g:javascript library="custom" />--%>
<%--	<g:javascript library="application" />--%>
	<r:layoutResources />
	<g:layoutHead />
</head>
<body>
	<g:if test="${session.local}">
		<g:hiddenField name="local" id="local" value="${session.local}"/>
	</g:if>
	<g:render template="/layouts/header" />
	
	<%--<g:render template="/layouts/body" />--%>
	<g:layoutBody />
	
	<g:render template="/layouts/footer" />
	<r:layoutResources />
	<g:if test="${session.local}">
		<g:javascript src="i18n/cultures/globalize.culture.${session.local}.js" />
	</g:if>
</body>
</html>