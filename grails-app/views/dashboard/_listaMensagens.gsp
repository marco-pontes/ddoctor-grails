<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
	<div class="portlet-header ui-widget-header">
		<g:message code="box.emails.title" />
		<span class="ui-icon ui-icon-circle-arrow-s"></span>
	</div>
	<div class="portlet-content">
		<div class="hastable">
			<g:if test="${listaMensagens}">
				<table cellspacing="0">
					<thead>
						<tr>
							<td><g:message code="caixa.emails.assunto" />
							</td>
							<td><g:message code="caixa.emails.opcoes" />
							</td>
						</tr>
					</thead>
					<tbody>
						<g:each in="${listaMensagens}" status="i" var="mensagem">
							<tr class="${ (i % 2 == 0)? '' :'alt' }">
								<td>
									${mensagem.assunto}
								</td>
								<td style="width: 152px;">
									<g:link class="btn ui-state-default ui-corner-all" url="#" onClick="javascript:abreModalMensagens(event, ${mensagem.id});" style="float:left;">
										<span class="ui-icon ui-icon ui-icon-mail-open"></span>
										<g:message code="box.email.read" />
									</g:link>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<g:link action="listar" controller="mensagem" ><g:message code="link.to.mensagens" /></g:link>
			</g:if>
			<g:else>
				<div class="content-box-wrapper">
					<h4 style="border-bottom:none;font-weight: bold;"><g:message code="nenhuma.mensagem.message" /></h4>
				</div>
			</g:else>
		</div>
	</div>
</div>
<div id="modal_mensagens" title="${message(code:'modal.emails.manage.title') }"></div>
<script>
function abreModalMensagens(event, idMensagem) {
	event.preventDefault();
	var field = "<input type='hidden' name='mesagem.id' val='' class='mensagem_id'/>"
	$('#modal_mensagens .mensagem_id').remove();
	$('#modal_mensagens').append(field);
	$('#modal_mensagens .mensagem_id').val(idMensagem);
	var elem = $("div#modal_mensagens");
	elem.dialog("open");
	$("div.ui-widget-overlay").bind("click", {elem:elem}, fechaModal);
}

function fechaModal(event){
	$(event.data.elem).dialog("close");
}

jQuery(document).ready(function(){
	$("div#modal_mensagens").dialog({
		autoOpen : false,
		position : [ 'center', 'top' ],
		width : 475,
		modal : true,
		zIndex : 20000,
		open : function(event, ui) {
			var idMensagem = $('#modal_mensagens .mensagem_id').val();
			$.ajax({
				type : 'POST',
				data: {'mensagem.id': idMensagem},
				url : "../mensagem/inicializaModalDetalhes",
				success : function(resposta) {
					$('div#modal_mensagens').html(resposta);
				}
			});
		}
	});
	
})
</script>