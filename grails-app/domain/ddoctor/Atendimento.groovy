package ddoctor

class Atendimento {
	Paciente paciente
	Date data //Data do atendimento na clinica, diferente da data da consulta
	StatusAtendimento status
	Boolean pago
	Float precoTotal
	Consulta consulta
	static hasMany = [exames:Exame]
    static constraints = {
		status(nullable:true)
		consulta(nullable:false)
		data(nullable:true)
		exames(nullable:true)
    }
}
