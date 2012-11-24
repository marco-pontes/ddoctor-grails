package ddoctor

class Especialidade {
	String nome
	String descricao
    static constraints = {
		descricao(maxSize:500)
    }
}