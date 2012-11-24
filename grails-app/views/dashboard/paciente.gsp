<html>
<head>
	<title>Welcome to Grails</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="layout" content="main" />
	<r:require modules="dashboard_paciente"/>

</head>
<body>
	<div id="sub-nav">
		<ddoctor:breadcrumb pagina="${message(code:'dashboard.pacient.title')}" reset="true" />
<%--		<g:render template="/dashboard/top_buttons" />--%>
	</div>
	<div id="page-layout">
		<div id="page-content">
			<div id="page-content-wrapper">
				<div class="inner-page-title">
					<h2>
						<g:message code="dashboard.pacient.welcome.message"/>
					</h2>
					<span><g:message code="dashboard.pacient.welcome.hint" /> </span>
				</div>
				<div class="clear"></div>
				<div class="content-box">
					<g:if test="${flash.mensagem}">
		            	<div class="response-msg ${flash.mensagem.tipo} ui-corner-all">
							<span><g:message code="${flash.mensagem.tipo}.box.label" /></span>
							${flash.mensagem.texto}
						</div>
		            </g:if>
					<div class="inner-page-title">
						<h2>
							<g:message code="information.section.title" />
						</h2>
						<span><g:message code="information.section.hint" /></span>
					</div>
					<div class="three-column sortable">
					<div class="three-col-mid">
						<div class="column col1">
							<div class="content-box content-box-header">
								<div class="content-box-wrapper">
									<div id="chart1"></div>
								</div>
							</div>
						</div>

						<div class="column col2">
							<div class="content-box content-box-header">
								<div class="ui-state-default ui-corner-top ui-box-header">
									<span class="ui-icon float-left ui-icon-signal"></span>
									<g:message code="title.section.proximas.consultas"/>
								</div>
								<div class="yellow-box ui-corner-all" >
									<div class="cont ui-corner-all" style="line-height:1">
										<g:if test="${proximasConsultas}">
											<g:each in="${proximasConsultas}" var="proximaConsulta" >
												<div class="medico" style="width: 100%;">
													<div class="foto_pequena">
														<img src="${resource(dir:'images', file:'no_picture_doctor_small2.png')}" />
													</div>
													<div class="dados" style="width: 57%;">
														<g:link controller="medico" action="mostrar" id="${proximaConsulta?.medico?.id}">
															<h4>${proximaConsulta.medico.nome}</h4>
														</g:link>
														<div style="padding: 5px 5px;">
															${proximaConsulta.data}
															<g:message code="paciente.email.label"/>
															${proximaConsulta.medico.especialidade.nome}
															<g:link class="btn ui-state-default full-link ui-corner-all" controller="consulta" action="cancelar"><g:message code="button.cancel.consultation" /></g:link>
														</div>
													</div>
												</div>
											</g:each>
										</g:if>
										<g:else>
											<div class="content-box-wrapper">
												<h4 style="border-bottom:none;font-weight: bold;"><g:message code="nenhuma.proxima.consulta.message" /></h4>
											</div>
										</g:else>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<div class="content-box content-box-header">
								<div class="ui-state-default ui-corner-top ui-box-header">
									<span class="ui-icon float-left ui-icon-signal"></span>
									<g:message code="unconfirmed.consultations.box.title"/>
								</div>
								<div class="gray-box ui-corner-all" >
									<g:if test="${consultasNaoConfirmadas}">
										<g:each in="${consultasNaoConfirmadas}" var="consulta" >
											<div class="medico" style="width: 100%;">
												<div class="foto_pequena">
													<img src="${resource(dir:'images', file:'no_picture_doctor_small2.png')}" />
												</div>
												<div class="dados" style="width: 57%;">
													<g:link controller="medico" action="mostrar" id="${consulta?.paciente?.id}">
														<h4>${consulta.medico.nome}</h4>
													</g:link>
													<div style="padding: 5px 5px;">
														${consulta.data}
														<g:message code="paciente.email.label"/>
														${consulta.medico.especialidade.nome}
														<g:link class="btn ui-state-default full-link ui-corner-all" controller="consulta" action="remover"><g:message code="button.remove.consultation" /></g:link>
													</div>
												</div>
											</div>
										</g:each>
									</g:if>
									<g:else>
										<div class="content-box-wrapper">
											<h4 style="border-bottom:none;font-weight: bold;"><g:message code="nenhuma.proxima.consulta.message" /></h4>
										</div>
									</g:else>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="column col3">
							<div class="content-box content-box-header ui-corner-all">
								<div class="ui-state-default ui-corner-top ui-box-header">
									<span class="ui-icon float-left ui-icon-signal"></span>
									<g:message code="historico.consultas.titulo"/>
								</div>
								<g:if test="${atendimentosAnteriores.size() > 0}">
									<div id="accordion">
										<g:each in="${atendimentosAnteriores}" status="i" var="atendimento" >
											<h3>
												<a href="#">${atendimento.consulta.medico?.especialidade?.nome}
													<span style="float:right"><g:formatNumber number="${atendimento.precoTotal}"  maxFractionDigits="2"  type="currency"/></span>
												</a>
											</h3>
											<div>
											<g:if test="${atendimento.consulta}">
												<g:formatDate date="${atendimento.data}" format="dd/MM/yyyy" />
													<ul>
														<li><b>${atendimento.consulta.medico?.nome}</b></li>
														<li><g:formatNumber number="${atendimento.consulta.medico.precoConsulta}" maxFractionDigits="2"  type="currency"/></li>
													</ul>
											</g:if>
											<g:if test="${atendimento.exames}">
												<h4><g:message code="exames.section.label"/></h4>
												<g:each in="${atendimento.exames}" status="k" var="exame" >
													<ul>
														<li><b>${exame.nome}</b>: 
														<g:formatNumber number="${exame.preco}" maxFractionDigits="2"  type="currency"/></li>
													</ul>
												</g:each>
											</g:if>
											</div>
										</g:each>
									</div>
								</g:if>
								<g:else>
									<div class="content-box-wrapper">
										<h4 style="border-bottom:none;font-weight: bold;"><g:message code="nenhuma.consulta.anterior.message" /></h4>
									</div>
								</g:else>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
					<div class="inner-page-title">
						<h2>
							<g:message code="personal.section.title" />
						</h2>
						<span><g:message code="personal.section.hint" />
						</span>
					</div>
					<div class="two-column">
						<div class="column" unselectable="on" style="-moz-user-select: none;">
							<g:render template="/dashboard/listaMensagens"  model="[listaMensagens: listaMensagens]" ></g:render>
							<g:each in="${listaMensagens}" var="aviso" status="i">
								<g:if test="${aviso.tipo == 'Erro'}">
									<div class="response-msg error ui-corner-all">
										<span><g:message code="error.box.label" />
										</span>
										${aviso.corpo}
									</div>
								</g:if>
								<g:elseif test="${aviso.tipo == 'Sucesso'}">
									<div class="response-msg success ui-corner-all">
										<span><g:message code="success.box.label" />
										</span>
										${aviso.corpo}
									</div>
								</g:elseif>
								<g:elseif test="${aviso.tipo == 'Atenção'}">
									<div class="response-msg notice ui-corner-all">
										<span><g:message code="warn.box.label" />
										</span>
										${aviso.corpo}
									</div>
								</g:elseif>
								<g:elseif test="${aviso.tipo == 'Informação'}">
									<div class="response-msg inf ui-corner-all">
										<span><g:message code="info.box.label" />
										</span>
										${aviso.corpo}
									</div>
								</g:elseif>
							</g:each>
						</div>
						<div class="column column-right" style="-moz-user-select: none;" unselectable="on">
							<div class="other-box gray-box float-left ui-corner-all" style="margin:0; width: 100%;">
								<div class="cont ui-corner-all hastable">
									<h3>Plano de Saude</h3>
									<table cellspacing="0" class="plano-saude">
											<thead>
												<tr>
													<td>Nome</td>
													<td>Tipo</td>
	
													<td>Validade</td>
													<td>Numero</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<p>${pacienteInstancia.planoSaude.nome}</p>
													</td>
												
													<td>
														<p>${pacienteInstancia.planoSaude.tipo}</p>
													</td>
												
													<td>
														<p><g:formatDate date="${pacienteInstancia.planoSaude.validade}" format="dd/MM/yy"/></p>
													</td>
												
													<td>
														<p>${pacienteInstancia.planoSaude.numero}</p>
													</td>
												</tr>
											</tbody>
									</table>
								</div>
							</div>
						
						</div>
						
						
						
					</div>
					<div class="clear"></div>
					
					<div id="modal_consulta" title="${message(code:'modal.marcar.consulta.title') }">
					</div>
				</div>
				<g:render template="/templates/sidebar" />
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<g:each in="${graficoAtendimentosAnteriores}" status="i" var="atendimento" >
		<div class="atendimento">
			<g:hiddenField name="valor" class="valor" value="${formatNumber(number:atendimento.valor, locale:'en') }" />
			<g:hiddenField name="data" class="data" value="${formatDate(date:atendimento.data, formatName:'date.consulta.charts.format')}" />
		</div>
	</g:each>									
</body>

</html>




