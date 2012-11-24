package ddoctor

enum StatusAtendimento implements org.springframework.context.MessageSourceResolvable{

	AGUARDANDO_CHEGADA, AGUARDANDO_ATENDIMENTO, EM_ATENDIMENTO, FINALIZADO

	Object[] getArguments() { [] as Object[] }

	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}

	String getDefaultMessage() { name() }
}
