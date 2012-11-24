<div id="page-layout">
	<div id="page-content">
		<div id="page-content-wrapper">
			<div class="inner-page-title">
				<h2>
					<g:message code="agenda.show.title" /> ${medicoInstancia.nome}
				</h2>
				<span><g:message code="agenda.show.welcome.hint" /></span>
			</div>
			<div class="clear"></div>
			<div class="content-box">
				<g:if test="${flash.message}">
					<div class="response-msg inf ui-corner-all">
						<span><g:message code="info.box.label" /></span>
						${flash.message}
					</div>
				</g:if>
				<div class="other-box gray-box float-left ui-corner-all"
					style="width: 100%">
					<div class="cont ui-corner-all">
						<h3>
							${medicoInstancia.nome}
						</h3>
					</div>
					<div id="tabs" class="ui-widget ui-corner-all">
						<div id="tabs-1" class="ui-corner-bottom">
							<div id="agenda"></div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<div class="invisivel">
	<g:each in="${medicoInstancia.agenda.consultas}" var="consulta">
		<div class="evento">
			<g:if test="${perfil == 'ROLE_ATENDENTE'}">
				<span class="titulo"><g:message code="consultation.scheduled.name" args="${consulta.paciente.nome}"/></span>
			</g:if>
			<g:else>
				<span class="titulo"><g:message code="consultation.scheduled.noname"/> </span>
			</g:else>
			<span class="inicio"><g:formatDate date="${consulta.data}" format="MMM dd, yyyy hh:mm:ss" locale="en_us" /></span>
		</div>
	</g:each>
</div>

<script>
	$(document).ready(function() {
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var h = date.getHours();
		var eventos = [];
		function adicionaEvento(){
			var evento = new Object(); 
			var titulo = $(this).find('span.titulo').html();
			var inicio = new Date($(this).find('span.inicio').html());
			evento.title = titulo;
			evento.start = inicio;
			evento.end = inicio;
			evento.allDay = false;
			eventos.push(evento);
		}
		
		$('.evento').each(adicionaEvento);
		
		
		$('div#agenda').fullCalendar({
			theme: false,
			allDaySlot:true,
			minTime:6,
			maxTime:18,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
				}, 
			editable: true,
			events: eventos
		});
	})

</script>