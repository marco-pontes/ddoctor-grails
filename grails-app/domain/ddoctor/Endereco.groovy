package ddoctor

class Endereco {
	String rua
	String cep
	Integer numero
	String complemento
	String cidade
	String estado
    static constraints = {
		rua (nullable:true)
		cep (nullable:true)
		numero (nullable:true)
		cidade (nullable:true)
		complemento(nullable:true)
		estado (inList: ['AC','AL', 'AP','AM','BA','CE', 'DF', 'ES', 'GO', 'MA', 'MT','MS','MG', 'PA', 'PB', 'PR', 'PE', 'PI','RJ','RN', 'RS', 'RO','RR', 'SC', 'SP', 'SE', 'TO'] , blank:false)
		
    }
}
