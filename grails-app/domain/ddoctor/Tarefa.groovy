package ddoctor

class Tarefa {
	String nome
	String descricao
	Date dataCriacao
	StatusTarefa status
	Consulta consulta
    static constraints = {
		consulta(nullable:true)
    }
}
