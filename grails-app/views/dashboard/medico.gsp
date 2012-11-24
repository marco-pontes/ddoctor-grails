<html>
<head>
<title>Welcome to Grails</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="layout" content="main" />
	<r:require modules="dashboard_medico"/>
</head>
<body>
	<div id="sub-nav">
		<ddoctor:breadcrumb pagina="${message(code:'dashboard.doctor.title')}" reset="true"/>
<%--		<g:render template="/dashboard/top_buttons" />--%>
	</div>
	<div id="page-layout">
		<div id="page-content">
			<div id="page-content-wrapper">
				<div class="inner-page-title">
					<h2>
						<g:message code="dashboard.doctor.welcome.message"/>
					</h2>
					<span><g:message code="dashboard.doctor.welcome.hint"/></span>
				</div>
				<div class="clear"></div>
				<div class="content-box">
					<g:if test="${flash.mensagem}">
		            	<div class="response-msg ${flash.mensagem.'tipo'} ui-corner-all">
							<span><g:message code="${flash.mensagem.'tipo'}.box.label" /></span>
							${flash.mensagem.'texto'}
						</div>
		            </g:if>
					<div class="clear"></div>
					<div class="inner-page-title">
						<h2>
							<g:message code="information.section.title" />
						</h2>
						<span><g:message code="information.section.hint" /></span>
					</div>
					<div class="three-column sortable">
					<div class="three-col-mid">
						<div class="column col1">
							
							<div class="content-box content-box-header ui-corner-all">
								<div class="ui-state-default ui-corner-top ui-box-header">
									<span class="ui-icon float-left ui-icon-signal"></span>
									<g:message code="dashboard.consultas.aguardando"/>
								</div>
								<div class="hastable">
									<g:if test="${proximosAtendimentos?.size() > 0}">
										<table id="sort-table"> 
											<thead>
												<tr>
													<td><input type="checkbox" class="checkbox" value="" />
													</td>
													<td><g:message code="dashboard.consultas.horario"/></td>
													<td><g:message code="dashboard.consultas.paciente.nome"/></td>
													<td><g:message code="dashboard.atendimento.status"/></td>
													<td>Pago?</td>
	
													<td><g:message code="dashboard.atendimento.opcoes"/></td>
												</tr>
											</thead>
											<tbody>
													<g:each in="${proximosAtendimentos}" status="i" var="atendimento" >
														<tr class="${ (i%2 == 0) ? '' : 'alt' }">  	  	
															<td>
																<input type="checkbox" class="checkbox" value=""/>
															</td>
															<td>
																<g:formatDate date="${atendimento.consulta.data}" formatName="consulta.data.dashboard.medico" />
															</td>
															<td>
																${atendimento.paciente.nome} 
															</td>
															<td>
																<g:fieldValue bean="${atendimento}" field="status"></g:fieldValue>
															</td>
															<td>
																<g:formatBoolean boolean="${atendimento.pago}" true="${message(code:'message.yes')}" false="${message(code:'message.no')}" />
															</td>
															<td>
																<g:link class="btn ui-state-default ui-corner-all" url="../consulta/entrevistaMedica?atendimento.id=${atendimento.id}">
																	<span class="ui-icon ui-icon ui-icon-gripsmall-diagonal-se"></span>
																	<g:message code="botao.iniciar.consulta"/>
																</g:link>
															</td>
														</tr>
													</g:each>
											</tbody>
										</table>
									</g:if>	
									<g:else>
										<div class="content-box-wrapper">
											<h4 style="border-bottom:none;"><g:message code="nenhuma.consulta.message" /></h4>
										</div>
									</g:else>
								</div>
							</div>
						</div>

						<div class="column col2">
							
						</div>

						<div class="column col3">

							<div class="content-box content-box-header">
								<div class="content-box-wrapper">
									<h3>Resumo dos Atendimentos Atuais</h3>
									<p>
										<b><g:message code="atendimentos.aguardando.message" /> </b>
										${proximosAtendimentos?.size()}
									</p>
									<p>
										<b><g:message code="consultas.finalizados.message" /></b>
										${consultasFinalizadas?.size()}
									</p>
								</div>
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
						</div>
						<div class="column column-right" style="-moz-user-select: none;" unselectable="on">
							<div class="portlet ui-widget ui-helper-clearfix ui-corner-all">
								<div class="portlet-header ui-widget-header">
									<g:message code="box.agenda.title" />
									<span class="ui-icon ui-icon-circle-arrow-s"></span>
									<div id="agendaDia"></div>
									<g:link url="#" onClick="javascript:abreModalAgenda(event, ${usuario.id})">
										<g:message code="link.agenda.medico"/>
									</g:link>
								</div>
							</div>
						
						</div>
						
					</div>
					<div class="clear"></div>
					
				</div>
					<g:render template="/templates/sidebar" />

			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="invisivel">
		<g:each in="${proximosAtendimentos}" var="atendimento">
			<div class="evento">
				<span class="titulo">Consulta ${atendimento.paciente.nome}</span>
				<span class="inicio"><g:formatDate date="${atendimento.consulta.data}" format="MMM dd, yyyy hh:mm:ss" locale="en_us" /></span>
			</div>
		</g:each>
	</div>
</body>

</html>




