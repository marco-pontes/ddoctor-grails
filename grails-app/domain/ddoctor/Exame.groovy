package ddoctor

class Exame {
	String nome
	String descricao
	Float preco
	
	static belongsTo = Atendimento
    static constraints = {
		preco(nullable:false)
    }
}
