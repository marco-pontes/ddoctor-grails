package ddoctor

enum StatusTarefa implements org.springframework.context.MessageSourceResolvable{

	PENDENTE, RECUSADA, ACEITA, FINALIZADA

	Object[] getArguments() { [] as Object[] }

	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}

	String getDefaultMessage() { name() }
}
