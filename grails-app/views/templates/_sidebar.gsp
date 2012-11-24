		<div id="sidebar">
			<div class="sidebar-content">
				<a id="close_sidebar" class="btn ui-state-default full-link ui-corner-all" href="#drill">
					<span class="ui-icon ui-icon-circle-arrow-e"></span>
					<g:message code="close.sidebar.label" />
				</a>
				<a id="open_sidebar" class="btn tooltip ui-state-default full-link icon-only ui-corner-all" title="Open Sidebar" href="#"><span class="ui-icon ui-icon-circle-arrow-w"></span></a>
				<div class="hide_sidebar">
					<g:if test="${perfil == "ROLE_MEDICO" }">
						<g:if test="${controllerName.equals("dashboard") && actionName.equals("medico") }">	
							<div class="box ui-widget ui-widget-content ui-corner-all">
								<h3><g:message code="agenda.label.section" /></h3>
								<div class="content">
									<g:link url="#" class="btn ui-state-default full-link ui-corner-all" onClick="javascript:abreModalAgenda(event, ${usuario.id})">
									<span class="ui-icon ui-icon-arrowreturnthick-1-n"></span>
									<g:message code="link.agenda.medico"/>  </g:link>
								</div>
							</div>
						</g:if>
					</g:if>
					
					<g:if test="${perfil == "ROLE_ATENDENTE" }">
						<g:if test="${(controllerName.equals("dashboard") && actionName.equals("atendente")) ||
							(controllerName.equals("atendimento") && actionName.equals("listar")) ||
							(controllerName.equals("atendimento") && actionName.equals("mostrar")) }">	
							<div class="box ui-widget ui-widget-content ui-corner-all">
								<h3>Atendimentos</h3>
								<div class="content">
									<g:link class="btn ui-state-default full-link ui-corner-all atendimento_criar" url="#">
										<span class="ui-icon ui-icon-arrowreturnthick-1-n"></span>
										<g:message code="button.atendimento.new.label"/>
									</g:link>
								</div>
							</div>
							<div class="clear"></div>
						</g:if>
					</g:if>
					
					<g:if test="${perfil == "ROLE_PACIENTE" }">
						<g:if test="${controllerName.equals("dashboard") && actionName.equals("paciente") }">		
							<div class="box ui-widget ui-widget-content ui-corner-all">
								<h3><g:message code="titulo.consultas"/></h3>
								<div class="content">
									<g:link class="btn ui-state-default full-link ui-corner-all consulta_criar" url="#">
										<span class="ui-icon ui-icon-arrowreturnthick-1-n"></span>
										<g:message code="botao.incluir.consulta"/>
									</g:link>
								</div>
							</div>
						</g:if>
					</g:if>
					
					
					<g:if test="${perfil == "ROLE_ADMIN" }">
						<g:if test="${controllerName.equals("medico") && actionName.equals("listar") }">		
							<div class="box ui-widget ui-widget-content ui-corner-all">
								<h3><g:message code="sidebar.admin.section"/></h3>
								<div class="content">
									<g:link class="btn ui-state-default full-link ui-corner-all consulta_criar" url="#">
										<span class="ui-icon ui-icon-arrowreturnthick-1-n"></span>
										<g:message code="botao.incluir.consulta"/>
									</g:link>
								</div>
							</div>
						</g:if>
						<g:if test="${controllerName.equals("paciente") && actionName.equals("listar") }">	
							<div class="box ui-widget ui-widget-content ui-corner-all">
								<h3><g:message code="sidebar.admin.section"/></h3>
								<div class="content">
									<g:link class="btn ui-state-default full-link ui-corner-all" action="create">
										<span class="ui-icon ui-icon-arrowreturnthick-1-n"></span>
										<g:message code="button.pacient.new.label"/>
									</g:link>
									
								</div>
							</div>
							<div class="clear"></div>
						</g:if>
					</g:if>
					
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="modal_atendimento" title="${message(code:'create.consultation.modal.title') }"></div>
		<div id="modal_agenda" title="${message(code:'modal.agenda.manage.title') }"></div>
		<g:hiddenField name="urlInicializaModal" id="url_inicializa_modal" value="${createLink(controller:'atendimento', action:'inicializaModalAtendimento')}"/>
		<script>

		function abreModalAgenda(event, idMedico) {
			event.preventDefault();
			var field = "<input type='hidden' name='agenda.id' val='' class='medico_id'/>";
			$('#modal_agenda .medico_id').remove();
			$('#modal_agenda').append(field);
			$('#modal_agenda .medico_id').val(idMedico);
			var elem = $("div#modal_agenda");
			elem.dialog("open");
			$("div.ui-widget-overlay").bind("click", {elem:elem}, fechaModal);
		}
		
		$(document).ready(function() {
			var urlInicializaModal = $('input#url_inicializa_modal').val();
			$("div#modal_atendimento").dialog({
			autoOpen : false,
			position : [ 'center', 'top' ],
			width : 800,
			modal : true,
			zIndex : 20000,
			open : function(event, ui) {
				$.ajax({
					type : 'POST',
					url : urlInicializaModal,
					success : function(resposta) {
						$('div#modal_atendimento').html(resposta);
					}
				});
			}
		});

		$("div#modal_agenda").dialog({
			autoOpen : false,
			position : [ 'center', 'top' ],
			width : 500,
			modal : true,
			zIndex : 20000,
			open : function(event, ui) {
				var idMedico = $('#modal_agenda .medico_id').val();
				$.ajax({
					type : 'POST',
					data: {'id': idMedico},
					url : "../agenda/inicializaModalAgenda",
					success : function(resposta) {
						$('div#modal_agenda').html(resposta);
					}
				});
			}
		});
		
		function abreModalAtendimento(event) {
			event.preventDefault();
			var elem = $("div#modal_atendimento");
			elem.dialog("open");
			$("div.ui-widget-overlay").bind("click", {elem:elem}, fechaModal);
		}
		$('.atendimento_criar').bind('click', abreModalAtendimento);

		});	
	</script>