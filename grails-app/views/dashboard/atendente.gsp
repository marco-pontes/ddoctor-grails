<html>
	<head>
	<title>Welcome to Grails</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="layout" content="main" />
	<r:require modules="dashboard_atendente"/>
</head>
<body>
	<div id="sub-nav">
		<ddoctor:breadcrumb pagina="${message(code:'dashboard.atendant.title')}" reset="true"/>
	</div>
	<div id="page-layout">
		<div id="page-content">
			<div id="page-content-wrapper">
				<div class="inner-page-title">
					<h2>
						<g:message code="dashboard.atendant.welcome.message" />
					</h2>
					<span><g:message code="dashboard.atendant.welcome.hint" /></span>
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
						<span><g:message code="information.section.hint" />
						</span>
					</div>
					<div class="two-column">
						<div class="column" style="width: 70%;">
							<div class="content-box content-box-header">
								<div class="ui-state-default ui-corner-top ui-box-header">
									<span class="ui-icon float-left ui-icon-signal"></span>
									<g:message code="header.autocomplete.paciente"/>
								</div>
								<div class="content-box-wrapper" id="info_paciente">
									<label class="desc" for="lastname"><g:message code="paciente.nome.label"/> </label>
									<g:textField id="autocomplete_pacientes_text" name="pacientes_autocomplete_txt" class="field text" style="width: 296px;"/>
									<div class="gray-box ui-corner-all" style="margin-bottom:5px;margin-top: 10px;">
										<div class="cont ui-corner-all" style="line-height:1" >
											<h3><g:message code="search.pacient.message" /></h3>
											<div class="two-column">
												<div class="column" id="dados_paciente">
													<g:message code="pacient.info.here.message" />
												</div>
												<div class="column">
													<ul class="ui-widget ui-helper-clearfix invisivel" id="icons">
														<g:link class="btn ui-state-default ui-corner-all" url="javascript: confirmaChegada();" style="" >
															<span class="ui-icon ui-icon ui-icon-cancel"></span>
															<g:message code="button.confirm.arrival" />
														</g:link>
													</ul>
												</div>
												<div class="clear"></div>
											</div>
										</div>
									</div>
									<div class="hastable">
									<g:if test="${atendimentosAguardandoChegada.size() > 0}">
										<g:render template="/atendimento/listaAtendimentos" model="[atendimentosAguardandoChegada:atendimentosAguardandoChegada]"></g:render>
									</g:if>	
									<g:else>
										<div class="content-box-wrapper">
											<h4 style="border-bottom:none;"><g:message code="nenhuma.consulta.message" /></h4>
										</div>
									</g:else>
								</div>
								</div>
							</div>
						</div>
						<div class="column column-right" style="width: 28%;">
							<div class="content-box content-box-header ui-corner-all">
								<div class="ui-state-default ui-corner-top ui-box-header">
									<span class="ui-icon float-left ui-icon-signal"></span>
									<g:message code="tabela.pendentes"/>
								</div>
								<div class="hastable">
									<g:if test="${consultasAguardandoConfirmacao.size() > 0}">
										<table cellspacing="0">
											<thead>
												<tr>
													<td><g:message code="paciente.nome"/></td>
													<td><g:message code="paciente.documento"/></td>
													<td><g:message code="tabela.opcoes"/> </td>
												</tr>
											</thead>
											<tbody>
												<g:each in="${consultasAguardandoConfirmacao}" status="i" var="consulta" >
													<tr class="${ (i%2 == 0) ? '' : 'alt' }">  	  	
														<td>
															${consulta.paciente.nome} 
														</td>
														<td>
															${consulta.paciente.documento} 
														</td>
														<td>
															<a class="btn ui-state-default ui-corner-all" href="#">
																<span class="ui-icon ui-icon ui-icon-gripsmall-diagonal-se"></span>
																<g:message code="botao.confirmar.atendimento" />
															</a>
														</td>
													</tr>
												</g:each>
											</tbody>
										</table>
									</g:if>	
									<g:else>
										<div class="content-box-wrapper">
											<h4 style="border-bottom:none;"><g:message code="nenhuma.consulta.message"/></h4>
										</div>
									</g:else>
								</div>
							</div>
						</div>
						<div class="column column-right" style="width: 28%;">
							<div class="content-box content-box-header">
								<div class="content-box-wrapper">
									<h3>Resumo dos Atendimentos Atuais</h3>
									<p>
										<b>Atendimentos de hoje:</b>
										${atendimentosHoje.size()}
									</p>
									<p>
										<b>Próximos Atendimentos:</b>
										${atendimentosMes.size()}
									</p>
									<%--							<div class="agenda"></div>--%>
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
							<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
								<div class="portlet ui-widget ui-helper-clearfix ui-corner-all">
									<div class="portlet-header ui-widget-header">
										<g:message code="box.tasks.title" />
										<span class="ui-icon ui-icon-circle-arrow-s"></span>
									</div>
									<div class="portlet-content">
										<g:if test="${listaTarefas}" >
											<div class="hastable minha-tabela">
												<g:each in="${listaTarefas}" status="i" var="tarefa">
													<span style="float:left;"></span>
													<div class="yellow-box ui-corner-all other-box" style="margin-bottom:5px;">
														<div class="cont ui-corner-all" style="line-height:1">
															<h3><g:message code="attention.box.title"/></h3>
															${tarefa.nome}
															<g:link class="btn ui-state-default ui-corner-all" style="margin:0;" url="#" onClick="javascript:abreModalTarefa(event, ${tarefa.id});">
																<span class="ui-icon ui-icon ui-icon-cancel"></span>
																<g:message code="tasks.manage.button" />
															</g:link>
															<div class="clear"></div>
														</div>
													</div>
												</g:each>
												<g:link action="listar" controller="tarefa" ><g:message code="link.to.tarefas" /></g:link>
											</div>
										</g:if>
										<g:else>
											<div class="content-box-wrapper">
												<h4 style="border-bottom:none;font-weight: bold;"><g:message code="nenhuma.tarefa.message" /></h4>
											</div>
										</g:else>
									</div>
								</div>
							</div>						
						</div>
					</div>
					<div class="clear"></div>
					<div id="modal_tarefas" title="${message(code:'modal.task.manage.title') }"></div>
				</div>
				<g:render template="/templates/sidebar" />
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>