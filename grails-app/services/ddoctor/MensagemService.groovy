package ddoctor

import ddoctor.usuario.Usuario
import java.text.SimpleDateFormat;
import java.util.ArrayList;

class MensagemService {
	def springSecurityService
    static transactional = true

	/**
	* Método usado para criar uma mensagem para avisar o atendente
	* de que uma nova consulta foi marcada por um usuário.
	* @param {@link ddoctor.usuario.Usuario} destinatario
	*/
    def consultaMarcada(destinatario) {
		def mensagemInstancia = new Mensagem()
		mensagemInstancia.destinatario = destinatario
		mensagemInstancia.remetente = springSecurityService.getCurrentUser()
		mensagemInstancia.assunto = "Nova Consulta Marcada"
		mensagemInstancia.tipo = TipoMensagem.INFO
		mensagemInstancia.corpo = "Nova consulta incluída no sistema"
		mensagemInstancia.dataEnvio  = new Date()
		mensagemInstancia.save(flush:true)
    }
	
	/**
	* Método usado para criar uma mensagem para informar o usuário
	* sobre a confirmação de uma consulta.
	* @param {@link ddoctor.Consulta} consulta
	*/	
	def consultaConfirmada(Consulta consulta) {
		def mensagemInstancia = new Mensagem()
		mensagemInstancia.destinatario = consulta.paciente
		mensagemInstancia.remetente = springSecurityService.getCurrentUser()
		mensagemInstancia.assunto = "A Sua Consulta Foi Confirmada!"
		mensagemInstancia.tipo = TipoMensagem.INFO
		def dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(consulta.data)
		def horaFormatada = new SimpleDateFormat("hh:mm").format(consulta.data)
		mensagemInstancia.corpo = """A consulta marcada para o dia  ${dataFormatada}
									foi confirmada no sistema!
									Compareça na clínica no dia ${consulta.data.date} as ${horaFormatada}
									para realizar a consulta com o médico ${consulta.medico.nome}."""
		mensagemInstancia.dataEnvio  = new Date()
		mensagemInstancia.save(flush:true)
	}
	
	/**
	* Método usado para criar uma mensagem para informar o usuário
	* sobre o cancelamento de uma consulta.
	* @param {@link ddoctor.Consulta} consulta
	*/
	def consultaCancelada(Consulta consulta) {
		def mensagemInstancia = new Mensagem()
		mensagemInstancia.destinatario = consulta.paciente
		mensagemInstancia.remetente = springSecurityService.getCurrentUser()
		mensagemInstancia.assunto = "Consulta não confirmada"
		mensagemInstancia.tipo = TipoMensagem.INFO
		def dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(consulta.data)
		mensagemInstancia.corpo = """A consulta marcada para o dia  ${dataFormatada}
									foi cancelada no sistema!
									Marque a consulta em uma outra data ou ligue para a clínica para agendar um novo horário."""
		mensagemInstancia.dataEnvio  = new Date()
		mensagemInstancia.save(flush:true)
	}
	
	
	/**
	* Método chamado para buscar mensagens de um usuário.
	* @param ddoctor.usuario.Usuario
	* @return ArrayList<Atendimento>
	*/
	def buscaMensagens(Usuario usuario) {
		def mensagens = Mensagem.findAll("from Mensagem as m where m.destinatario=?",[usuario],[max:4])//findAllByDestinatario(usuario)
		return mensagens
	}
}
