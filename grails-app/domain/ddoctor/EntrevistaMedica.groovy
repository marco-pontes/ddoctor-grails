package ddoctor

class EntrevistaMedica {
	String problema
	String medicacao
	String observacoes
	String laudoMedico
	String altura
	String peso
	String pressao
	
	static belongsTo = Consulta
    static constraints = {
		altura(nullable:false, blank:false)
		peso(nullable:false, blank:false)
		pressao(nullable:false, blank:false)
		problema(maxSize:500, nullable:false, blank:false)
		observacoes(maxSize:500, nullable:true, blank:true)
		laudoMedico(maxSize:500, nullable:false, blank:false)
		medicacao(nullable:false, blank:false)
    }
}
