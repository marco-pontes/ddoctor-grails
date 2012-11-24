package ddoctor

enum TipoMensagem implements org.springframework.context.MessageSourceResolvable{

	SUCESSO, INFO, ATENCAO, ERRO

	Object[] getArguments() { [] as Object[] }

	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}

	String getDefaultMessage() { name() }
}
