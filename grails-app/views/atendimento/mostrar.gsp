
<%@ page import="ddoctor.Atendimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'atendimento.label', default: 'Atendimento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <r:require modules="atendimento_mostrar"/>
    </head>
    <body>
    
    	<div id="sub-nav">
			<ddoctor:breadcrumb pagina="${message(code:'consultation.confirm.title')}" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="atendimento.show.welcome.message" /></h2>
						<span><g:message code="atendimento.show.welcome.hint" /></span>
					</div>
					<div class="clear"></div>
					<div class="content-box">
			            <g:if test="${flash.mensagem}">
			            	<div class="response-msg ${flash.tipo.toString().equals('INFO')? 'inf' : 'error'} ui-corner-all">
								<span><g:message code="info.box.label" /></span>
								${flash.mensagem}
							</div>
			            </g:if>
						<div class="other-box gray-box ui-corner-all">
							<div class="cont ui-corner-all">
								<h2>
									<g:message code="atendimento.status.label"/>
									${fieldValue(bean:atendimentoInstancia, field:'status')} 
								</h2>
								<br/>
								<div class="paciente">
									<h2><g:message code="pacient.section.title"/></h2>
									<div class="foto">
										<img src="${resource(dir:'images',file:'no_picture.png')}" />
									</div>
									<div class="dados">
										<g:link controller="paciente" action="show" id="${atendimentoInstancia.consulta?.paciente?.id}">
											<h3>${atendimentoInstancia.consulta?.paciente?.nome}</h3>
										</g:link>
										<div style="padding: 20px 10px;">
											<g:message code="paciente.telefone.label"/>
											${atendimentoInstancia.consulta?.paciente?.telefone} <br/>
											<g:message code="paciente.email.label"/>
											${atendimentoInstancia.consulta?.paciente?.email}<br/>
										</div>
									</div>
								</div>
								<div class="medico">
									<h2><g:message code="doctor.section.title"/> </h2>
									<div class="foto">
										<img src="${resource(dir:'images',file:'no_picture_doctor2.png')}" />
									</div>
									<div class="dados">
										<g:link controller="medico" action="show" id="${atendimentoInstancia.consulta?.paciente?.id}">
											<h3>${atendimentoInstancia.consulta?.medico?.nome}</h3>
										</g:link>
										<div style="padding: 20px 10px;">
											<g:message code="paciente.telefone.label"/>
											${atendimentoInstancia.consulta?.medico?.telefone} <br/>
											<g:message code="paciente.email.label"/>
											${atendimentoInstancia.consulta?.medico?.email}<br/>
										</div>
									</div>
									<div style="float:left;width:20%;padding: 20px 10px;">
<%--								<g:link action="mostrar" controller="agenda" id="${pacienteInstancia.agenda.id}"><g:message code="link.agenda.paciente"/>  </g:link>--%>
<%--								<div><g:message code="paciente.preco.consulta.label"/><g:formatNumber number="${pacienteInstancia.precoConsulta}" type="currency"/></div>--%>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="other-box yellow-box ui-corner-all">  
							<div class="cont ui-corner-all">
								<h3><g:message code="consultation.date.info" /> </h3>
								<g:message code="consultation.status.label"/>
									${fieldValue(bean:atendimentoInstancia.consulta, field:'status')} <br/>
								<b>
									<g:message code="consultation.date.label"/>
									<g:formatDate date="${atendimentoInstancia.consulta?.data}" formatName="consultation.date.format" />
								</b>
								<br/>
								<b>
									<g:message code="atendimento.date.label"/>
									<g:formatDate date="${atendimentoInstancia?.data}" formatName="consultation.date.format" />
								</b>
							</div>
						</div>
		                <g:form>
		                    <g:hiddenField name="id" value="${atendimentoInstancia.consulta?.id}" />
		                    <g:if test="${tarefaInstancia?.id}">
			                    <g:hiddenField name="tarefa.id" value="${tarefaInstancia?.id}" />
			                    <ul>
			                    	<li class="buttons">
										<g:actionSubmit class="ui-state-default ui-corner-all ui-button" action="confirmar" value="${message(code: 'button.confirm.consultation.label')}" onclick="return confirm('${message(code: 'message.confirm.consultation.confirmation')}');" />
									</li>
								</ul>
							</g:if>
		                </g:form>
        			</div>
        			<g:render template="/templates/sidebar" />
        		</div>
        	</div>
        </div>
    </body>
</html>
