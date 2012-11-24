package ddoctor

import ddoctor.usuario.Usuario;

class Paciente extends Usuario {
	String historico
	PlanoSaude planoSaude
    static constraints = {
		historico (nullable:true, maxSize:1000)
    }
}
