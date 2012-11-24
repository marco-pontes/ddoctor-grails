package ddoctor

enum StatusConsulta implements org.springframework.context.MessageSourceResolvable{

	CONFIRMADA, CANCELADA, PENDENTE, FINALIZADA

	Object[] getArguments() { [] as Object[] }

	String[] getCodes() {
		["${getClass().name}.${name()}"] as String[]
	}

	String getDefaultMessage() { name() }
}
