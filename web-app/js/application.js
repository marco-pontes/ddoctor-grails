local = $('input#local').val();
localMoeda = $('input#local_moeda').val();
if (local == ""){local = "pt-BR"}
if (localMoeda == ""){localMoeda = "BRL"}
Globalize.culture(local);


function fechaModal(event){
	$(event.data.elem).dialog("close");
}

function apagaEmail(event, idMensagem) {
	event.preventDefault();
	if (confirm(Globalize.localize("confirm.delete.message.question"))){
		$.ajax({
			type : 'POST',
			data: {'mensagem.id': idMensagem},
			url : "../mensagem/apagar",
			success: function(resposta){
				if(resposta.code == 1){
					window.location.reload();
				}
			}
		});
	}
}
