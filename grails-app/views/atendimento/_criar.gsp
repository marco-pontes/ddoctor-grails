	<div id="page-layout">
		<div id="page-content">
			<div id="page-content-wrapper">
				<div class="content-box">
					<div class="clearfix"></div>
		            <g:if test="${flash.mensagem}">
		            	<div class="response-msg ${flash.mensagem.tipo} ui-corner-all">
							<span><g:message code="${flash.mensagem.tipo}.box.label" /></span>
							${flash.mensagem.texto}
						</div>
		            </g:if>
		            <g:hasErrors bean="${atendimentoInstancia}">
			     		<div class="response-msg error ui-corner-all">
							<span><g:message code="error.box.label" /></span>
							<g:renderErrors bean="${atendimentoInstancia}" as="list" />
						</div>
		            </g:hasErrors>
		            <g:form url="[action:'salvar']" class="forms" id="form_atendimento" >
		            	<g:hiddenField name="perfil" value="${perfil}" />
                       	<div class="inner-page-title">
							<h2>
								<g:message code="pacient.section.title" />
							</h2>
						</div>	
						<g:textField id="modal_paciente_nome" name="consulta.paciente.nome" 
							class="field text ${hasErrors(bean: consultaInstancia, field: 'paciente', 'errors')}" 
							placeholder="${message(code:'pacient.input.hint')}"/>
						<g:hiddenField id="modal_paciente_id" name="consulta.paciente.id" class="field text"/>
						<div class="gray-box ui-corner-all info_paciente" style="margin-bottom:5px;margin-top: 10px;">
							<div class="cont ui-corner-all" style="line-height:1">
								<h3></h3>
								<div class="two-column">
									<div class="column dados_paciente">
										<g:message code="pacient.info.here.message" />
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>						
                      	<div class="inner-page-title">
							<h2>
								<g:message code="doctor.section.title" />
							</h2>
						</div>
						<g:textField id="modal_medico_nome" name="consulta.medico.nome" 
							class="field textclass ${hasErrors(bean: consultaInstancia, field: 'medico', 'errors')}" 
							placeholder="${message(code:'doctor.input.hint')}"/>
						<g:hiddenField id="modal_medico_id" name="consulta.medico.id" class="field text"/>
						<div class="gray-box ui-corner-all info_medico" style="margin-bottom:5px;margin-top: 10px;">
							<div class="cont ui-corner-all" style="line-height:1">
								<h3></h3>
								<div class="two-column">
									<div class="column dados_medico">
										<g:message code="doctor.info.here.message" />
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>		
						<div id="wrapper_agenda" class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all invisivel" style="width:50%;">
							<div class="portlet-header ui-widget-header">
								<g:message code="doctor.appointment.book" />
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
		               			<h4><g:message code="consultation.summary.title"/></h4>
		               			<div id="resumo"></div>
	               			</div>
	               		</div>
	               		<div class="clearfix"></div>
	                    <span id="botao_salvar" class="ui-state-default ui-corner-all ui-button">
	                   		${message(code: 'default.button.create.label', default: 'Create')}
	                    </span>
	            </g:form>
	        </div>
		</div>
	</div>
</div>
<div id="modal_sucesso" title="${message(code:'modal.message.standard.title') }">
</div>
<script>
$(document).ready(function(){
	$("#modal_atendimento #modal_paciente_nome").autocomplete({
		source : "../paciente/autocompleteNomes",
		minLength : 1,
		select : function(event, ui) {
			$("#modal_atendimento #modal_paciente_id").val(ui.item.id);
			$("#modal_atendimento #modal_paciente_nome").val(ui.item.nome);
			$('#modal_atendimento div.info_paciente').find('h3').html(ui.item.nome);
			$('#modal_atendimento div.info_paciente').find('.dados_paciente').html(ui.item.documento);
			$('div#wrapper_resumo').fadeIn(800);
			atualizaResumo();
			return false;
		}
	})
	.data("autocomplete")._renderItem = function(ul, item) {
		return $("<li></li>").data("item.autocomplete", item).append(
				"<a><span>"+ item.nome + "</span><span style='float:right;width:100px;text-align:left;'>" 
				+ item.documento + "</span></a>").appendTo(ul);
	};

	$("#modal_atendimento #modal_medico_nome").autocomplete({
		source : "../medico/autocompleteNomes",
		minLength : 1,
		select : function(event, ui) {
			$("#modal_atendimento #modal_medico_id").val(ui.item.id);
			$("#modal_atendimento #modal_medico_nome").val(ui.item.nome);
			$('#modal_atendimento div.info_medico').find('h3').html(ui.item.nome);
			$('#modal_atendimento div.info_medico').find('.dados_medico').html(ui.item.especialidade);
			atualizaResumo();
			buscaAgendaMedico(ui.item.id);
			return false;
		}
	})
	.data("autocomplete")._renderItem = function(ul, item) {
		return $("<li></li>").data("item.autocomplete", item).append(
				"<a><span>"+ item.nome + "</span><span style='float:right;width:100px;text-align:left;'>" 
				+ item.especialidade + "</span></a>").appendTo(ul);
	};

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
			for (i=0; i < consultas.length; i++){
				adicionaEvento(consultas[i]);
			}
		}
		$('div#agenda').fullCalendar({
			 select: function( startDate, endDate, allDay, jsEvent, view ){
				 $('input#consulta_data').val(Globalize.format( startDate, "dd/MM/yyyy hh:mm"));
				 atualizaResumo();
			 },
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

	function buscaAgendaMedico(idMedico) {
		if (idMedico != -1) {
			$.ajax({
				type : 'POST',
				url : "../medico/buscaAgendaMedico",
				data : {
					'medico.id' : idMedico
				},
				success : function(resposta) {
					$('div#wrapper_agenda').fadeIn(400);
					$('div#agenda').fullCalendar('destroy');
					criaAgenda(resposta.consultas);
				}
			});
		} else {
			$('div#wrapper_agenda').fadeOut(400);
		}
	}

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
					$('div#modal_atendimento').html($(this).data('resposta').html);
				}
			}
		},
		modal:true
	});
	
	function salvar() {
		$.ajax({
			type : 'POST',
			url : "../atendimento/salvar",
			data : $('form#form_atendimento').serialize() ,
			success : function(resposta) {
				$("div#modal_sucesso").text(resposta.msg);
				$('span#botao_salvar').unbind("click", salvar);
				$("div#modal_sucesso").data('resposta', resposta).dialog("open");
			}
		});
	}

	$('span#botao_salvar').bind("click", salvar);

	function atualizaResumo() {
		var paciente = $('input#modal_paciente_nome').val();
		var medico = $('input#modal_medico_nome').val();
		var data = $('input#consulta_data').val();
		var htmlResumo = ""
		if(paciente != ""){
			htmlResumo += "Paciente: " + paciente + " <br/>" 
		}
		if(medico != ""){
			htmlResumo += "Medico: " + medico + " <br/>" 
		}
		if(data != ""){
			htmlResumo += "Data: " + data + " <br/>" 
		}
		$('div#wrapper_resumo #resumo').html(htmlResumo);
	}
});
</script>	