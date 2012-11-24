package ddoctor

import ddoctor.usuario.Usuario;

class Medico extends Usuario {	
	Integer crm	
	String biografia
	Especialidade especialidade
	Agenda agenda
	Float precoConsulta
	static constraints = {
		crm blank:false, nullable:false, unique:true
		biografia maxSize:500, nullable:true
		especialidade nullable:true
    }

}
