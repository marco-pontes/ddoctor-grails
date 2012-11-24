package ddoctor

class Consulta {
	Medico medico
	Paciente paciente
	Date data
	StatusConsulta status
	EntrevistaMedica entrevistaMedica
	
	static belongsTo = Agenda, Tarefa
    static constraints = {
		entrevistaMedica(nullable:true)
		paciente(nullable:false)
		medico(nullable:false)
    }
}
