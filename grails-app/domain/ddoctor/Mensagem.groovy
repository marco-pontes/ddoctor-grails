package ddoctor

import ddoctor.usuario.Usuario

class Mensagem {

	Usuario destinatario
	Usuario remetente
	String assunto
	TipoMensagem tipo
	String corpo
	Date dataEnvio
	
    static constraints = {		
		corpo(maxSize:500)
		tipo ()
    }
}
