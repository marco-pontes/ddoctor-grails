package ddoctor.usuario

import ddoctor.Endereco
import ddoctor.Tarefa

class Usuario {

	transient springSecurityService

	String login
	String senha
	boolean ativo
	boolean contaExpirada
	boolean contaBloqueada
	boolean senhaExpirada
	String nome
	Integer idade
	String documento
	String telefone
	String sexo
	Date dataNascimento
	Endereco endereco
	String email
	
	static hasMany = [tarefas:Tarefa]
	
	static constraints = {
		login (blank: false, unique:true)
		senha (blank: false)
		nome (blank:false)
		sexo (inList:["Masculino","Feminino"], blank:false)
		dataNascimento (nullable:true)
		telefone (nullable:false)
		tarefas(nullable:true, blank:true)
		
	}

	static mapping = {
		senha column: '`senha`'
	}

	Set<Perfil> getAuthorities() {
		UsuarioPerfil.findAllByUsuario(this).collect { it.perfil } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		senha = springSecurityService.encodePassword(senha)
	}
}
