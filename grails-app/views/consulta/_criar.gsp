<%@ page import="ddoctor.Consulta" %>
        <g:set var="noSelection" value="${message(code:'default.select.option')}" />
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2><g:message code="consulta.criar.title"/> </h2>
						<span><g:message code="consulta.criar.hint"/></span>
					</div>
					<div class="clear"></div>
					<div class="content-box">
			            <g:if test="${flash.mensagem}">
			            	<div class="response-msg ${flash.mensagem.tipo} ui-corner-all">
								<span><g:message code="${flash.mensagem.tipo}.box.label" /></span>
								${flash.mensagem.texto}
							</div>
			            </g:if>
			            <g:hasErrors bean="${consultaInstancia}">
				     		<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								<g:renderErrors bean="${consultaInstancia}" as="list" />
							</div>
			            </g:hasErrors>
			            
			             <g:form url="[action:'salvar']" class="forms marcar_consulta" id="form_consulta" >
			            	<g:hiddenField name="consulta.paciente.id" value="${usuario.id}"/>
			            	<g:hiddenField name="perfil" value="${perfil}" />
							<div>
                                <label for="especialidade" class="desc">
									<g:message code="medico.especialidade.label" />
								</label>
								<div class="${hasErrors(bean: consultaInstancia, field: 'status', 'errors')}">
                                   	<g:select id="especialidade_id" name="especialidade.id" from="${especialidadesMedicosDisponiveis}" optionKey="id" optionValue="nome" noSelection="['-1':noSelection]" />
                              	</div>
							</div>
							
							<div style="display:none;" id="medicos">
                                <label for="medico" class="desc">
									<g:message code="consulta.medico.label" />
								</label>
								<div class="${hasErrors(bean: consultaInstancia, field: 'medico', 'errors')}">
                                   	<g:select class='field select small' id="consulta_medico" name="consulta.medico.id" from="${ddoctor.Medico.list()}" optionValue="nome" optionKey="id"  />
                              	</div>
							</div>
							
							<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" id="wrapper_agenda" style="display:none;width:50%;">
								<div class="portlet-header ui-widget-header">
									<g:message code="agenda.medico" />
									<span class="ui-icon ui-icon-circle-arrow-s"></span>
		                  		</div>
		                  		<div class="portlet-content">
		                  			<div id="agenda">
		                  				<g:hiddenField name="consulta.data" id="consulta_data" value=""/>
		                  			</div>
		                  		</div>
		                  	</div>
			                <div id="wrapper_resumo" class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all invisivel" style="width:50%;">
		               			<div class="portlet-content">
			               			<h4><g:message code="titulo.resumo.consulta"/></h4>
			               			<div id="resumo"></div>
		               			</div>
		               		</div>
		                  	<div class="clearfix"></div>
		                  
			                <div class="buttons">
			                    <span id="consulta_marcar" class="ui-state-default ui-corner-all ui-button" style="display: block;width:200px;">${message(code: 'button.marcar.consulta.label')} </span>
			                </div>
	                  		<div class="clearfix"></div>
		            	</g:form>
		        	</div>
				</div>
			<div id="modal_sucesso" title="${message(code:'modal.sucesso.consulta.title') }"></div>
		<script>
		$(document).ready(function() {
			
				function adicionaOptionSelect(medico){
					$('#consulta_medico').append("<option value=" + medico.id + ">" + medico.nome + "</option>");
				}
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				var h = date.getHours();
				var eventos = [];
				
				function adicionaEvento(consulta){
					var evento = new Object(); 
						var titulo = "consulta" + consulta.id;
						var inicio = new Date(consulta.data);
						evento.title = titulo;
						evento.start = inicio;
						evento.allDay = false;
						eventos.push(evento);
				}
				
				function criaAgenda(consultas){
					if(consultas){
						for (i in consultas){
							adicionaEvento(consultas[i]);
						}
					}
					$('div#agenda').fullCalendar({
						 select: function( startDate, endDate, allDay, jsEvent, view ){
							 $('input#consulta_data').val(Globalize.format( startDate, "dd/MM/yyyy hh:mm"));
							 atualizaResumo();
						 },
//						    dayClick: function(date, allDay, jsEvent, view) {
			//
//						        if (allDay) {
//						            alert('Clicked on the entire day: ' + date);
//						        }else{
//						            alert('Clicked on the slot: ' + date);
//						        }
//						    },
						theme: false,
						defaultView:'agendaWeek',
						allDaySlot:true,
						slotMinutes:20,
						minTime:8,
						maxTime:18,
						selectable:true,
						weekends: false,
						events:eventos
					});
				}
				
				function buscaMedicos() {
					if ($(this).val() != -1) {
						$.ajax({
							type : 'POST',
							url : "../medico/buscaMedicosPorEspecialidade",
							data : {
								'especialidade.id' : $(this).val()
							},
							success : function(resposta) {
								$('#consulta_medico option').remove();
								$('#consulta_medico').append("<option value='-1'>Selecionar</option>");
								if (resposta.length > 0) {
									for(i in resposta){
										adicionaOptionSelect(resposta[i]);
									}
									$('div#medicos').fadeIn(400);
								} else {
									$('div#medicos').fadeOut(400);
									$('div#wrapper_agenda').fadeOut(400);
								}
							}
						});
					} else {
						$('div#medicos').fadeOut(400);
					}
				}
				
				
				function buscaAgendaMedico() {
					atualizaResumo();
					$('div#wrapper_resumo').fadeIn(800);
					if ($(this).val() != -1) {
						$.ajax({
							type : 'POST',
							url : "../medico/buscaAgendaMedico",
							data : {
								'medico.id' : $(this).val()
							},
							success : function(resposta) {
								$('div#wrapper_agenda').fadeIn(400);
								$('div#agenda').fullCalendar( 'destroy' );
								criaAgenda(resposta.consultas);
							}
						});
					} else {
						$('div#wrapper_agenda').fadeOut(400);
					}
				}

				$('select#especialidade_id').bind('change', buscaMedicos);
				$('select#consulta_medico').bind('change', buscaAgendaMedico);
		});

		$("div#modal_sucesso").remove();
		$(document.body).append("<div id='modal_sucesso' class='' style='display: none;' title='Mensagem'> </div>");
		
		$("div#modal_sucesso").dialog({
			autoOpen:false,
			stack:true,
			buttons: {
				"OK": function() {
					if($(this).data('resposta').cod != 0){
						window.location.reload();
					}
					else{
						$(this).dialog( "destroy" );
						$('div#modal_consulta').html($(this).data('resposta').html);
					}
				}
			},
			modal:true
		});
		
		function salvar() {
			$.ajax({
				type : 'POST',
				url : "../consulta/salvar",
				data : $('form#form_consulta').serialize(),
				success : function(resposta) {
					$("div#modal_sucesso").text(resposta.msg);
					$('span#consulta_marcar').unbind("click", salvar);
					$("div#modal_sucesso").data('resposta', resposta).dialog("open");
				}
			});
		}
		$('span#consulta_marcar').unbind("click");
		$('span#consulta_marcar').bind("click", salvar);


		function atualizaResumo() {
			var medico = $('select#consulta_medico :selected').text();
			var data = $('input#consulta_data').val();
			var htmlResumo = ""
			if(medico != ""){
				htmlResumo += "Medico: " + medico + " <br/>" 
			}
			if(data != ""){
				htmlResumo += "Data: " + data + " <br/>" 
			}
			$('div#wrapper_resumo #resumo').html(htmlResumo);
		}
		
		</script>