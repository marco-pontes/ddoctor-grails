import grails.util.GrailsUtil

import org.hibernate.SessionFactory

import ddoctor.*
import ddoctor.usuario.Perfil
import ddoctor.usuario.Usuario
import ddoctor.usuario.UsuarioPerfil

import grails.util.GrailsUtil
import java.text.SimpleDateFormat

import org.hibernate.SessionFactory

import ddoctor.exceptions.ConsultationLimitException;
import ddoctor.usuario.Perfil
import ddoctor.usuario.Usuario
import ddoctor.usuario.UsuarioPerfil
class BootStrap {
	SessionFactory sessionFactory
	def tarefaService
	def mensagemService
	def consultaService

	def calendario = new GregorianCalendar()

	def planosSaude = [
		[nome:"Unimed", tipo:"Completo", validade:new Date(), numero:12345678],
	]

	def enderecos = [
		[rua:"Rua teste",cep:"89239300", numero:1369, complemento:"", cidade:"Joinville", estado:"SC"]
	]

	def pacientes = [
		[nome:"Paciente", idade:22, documento:"667223", telefone:34240587, sexo:"Masculino", 
			login:"paciente", email:"paciente@gmail.com", dataNascimento:new Date(), 
			password:"password", historico:"Sem Doenças anteriores."],
		[nome:"Daniele Oliveira", idade:22, documento:"445546", telefone:34240587, sexo:"Feminino", 
			login:"daniele", email:"daniele@gmail.com", dataNascimento:new Date(), 
			password:"password", historico:"Sem Doenças anteriores."],
		[nome:"Paulo Silva", idade:22, documento:"233233", telefone:34240587, sexo:"Masculino",
			login:"paulo", email:"paulo@gmail.com", dataNascimento:new Date(),
			password:"password", historico:"Sem Doenças anteriores."]
	]

	def atendentes = [
		[nome:"atendente", idade:22, documento:"345678", telefone:34240587, sexo:"Masculino", 
			login:"atendente", email:"atendente@gmail.com", dataNascimento:new Date(), 
			password:"password", turno:"noturno"],
	]

	def medicos = [
		[nome:"Medico Padrao", idade:22, documento:"23456", telefone:34240587, sexo:"Masculino", 
			login:"medico", email:"medico@yahoo.com", dataNascimento:new Date(),  password:"password", 
			crm:0000000001, agenda: new Agenda().save(), preco:200.0, telefone:"3433-8312"],
		[nome:"Tais Engel Ribeiro", idade:22, documento:"2345678", telefone:34240587, sexo:"Feminino", 
			login:"tais", email:"tais@gmail.com", dataNascimento:new Date(),  password:"password", 
			crm:0000000002, agenda: new Agenda().save(), preco:140.0, telefone:"3433-8312"],
		[nome:"Sergio José Ferreira", idade:22, documento:"456789", telefone:34240587, sexo:"Masculino", 
			login:"sergio", email:"sergio@gmail.com", dataNascimento:new Date(),  password:"password", 
			crm:0000000003, agenda: new Agenda().save(), preco:300.0, telefone:"3433-8312"],
		[nome:"Pedro Weingrill", idade:22, documento:"2345678", telefone:34240587, sexo:"Masculino", 
			login:"pedro", email:"pedro@hotmail.com", dataNascimento:new Date(),  password:"password", 
			crm:0000000004, agenda: new Agenda().save(), preco:100.0, telefone:"3433-8312"]
		]

	def perfis = [
		[authority:"ROLE_PACIENTE"],
		[authority:"ROLE_MEDICO"],
		[authority:"ROLE_ATENDENTE"]
	]

	def atendimentos = [
		[data: new Date(), status: StatusAtendimento.AGUARDANDO_CHEGADA, pago:false, preco:200.00],
		[data: new Date(), status: StatusAtendimento.AGUARDANDO_CHEGADA, pago:false, preco:140.00],
		[data: new Date(), status: StatusAtendimento.AGUARDANDO_CHEGADA, pago:true, preco:200.00],
	]
	
	def especialidades = [
		[nome:"Endocrinologista", descricao:"""As principais áreas de atuação do especialista endocrinologista são: o tratamento do câncer, da obesidade mórbida, 
			desordens da glândula hipófise, alterações do ciclo menstrual, tratamento e acompanhamento de pacientes diabéticos
			 e outras doenças relacionadas com a deficiência ou o excesso de suco gástrico."""],
		[nome:"Gastroenterologista", descricao: """Especialidade médica que se ocupa do estudo, diagnóstico e 
			tratamento clínico das doenças do aparelho digestivo."""],
		[nome:"Neurologista", descricao: """Neurologia é a especialidade médica que trata dos distúrbios estruturais do sistema nervoso. 
			Especificamente, ela lida com o diagnóstico e tratamento de todas as categorias de doenças que envolvem 
			os sistemas nervoso central, periférico e autônomo, incluindo os seus revestimentos, vasos sanguíneos, 
			e todos os tecidos efetores, como os músculos.O correspondente cirúrgico da especialidade é a neurocirurgia."""],
		[nome:"Cardiologista", descricao: """Cardiologia é a especialidade médica que se ocupa do diagnóstico e 
			tratamento das doenças que acometem o coração bem como os outros componentes do sistema circulatório."""],
		[nome:"Ortopedista", descricao: """A Ortopedia é a especialidade médica que cuida das doenças e 
			deformidades dos ossos, músculos, ligamentos, articulações, enfim, elementos relacionados ao aparelho locomotor."""],
		[nome:"Psiquiatra", descricao:"""Psiquiatria é uma especialidade da Medicina que lida com a prevenção, 
			atendimento, diagnóstico, tratamento e reabilitação das diferentes formas de sofrimentos mentais, 
			sejam elas de cunho orgânico ou funcional, com manifestações psicológicas severas. 
			São exemplos: a depressão, o transtorno bipolar, a esquizofrenia, a demência e os transtornos de ansiedade."""],
		[nome:"Oftamologista", descricao: """A oftalmologia é uma das especialidades da Medicina. 
			É um ramo da medicina que investiga e trata as doenças relacionadas com a visão e com os olhos e seus anexos."""]
		]

	def entrevistas = [
		[problema:"Descricao do problema", medicacao:"Diazepam", observacoes:"obs",
			laudoMedico:"O paciente deve realizar outros exames para...", altura:"1.83",
			peso:"79kg", pressao:"14x8", preco:50.00],
		[problema:"Descricao do problema", medicacao:"Diazepam", observacoes:"obs",
			laudoMedico:"O paciente deve realizar outros exames para...", altura:"1.83",
			peso:"79kg", pressao:"14x8", preco:50.00],
		[problema:"Descricao do problema", medicacao:"Diazepam", observacoes:"obs",
			laudoMedico:"O paciente deve realizar outros exames para...", altura:"1.83",
			peso:"79kg", pressao:"14x8", preco:50.00],
	]

	def mensagens = [
		[assunto: "Data Indisponível Adicionada na Agenda",
			corpo: "O médico João Ninguém estará indisponível na data: 23/03 durante o dia inteiro.", 
			dataEnvio: new Date(), tipo:TipoMensagem.SUCESSO],
		[assunto: "Data Indisponível Adicionada na Agenda",
			corpo: "O médico João Ninguém estará indisponível na data: 23/03 durante o dia inteiro.", 
			dataEnvio: new Date(), tipo:TipoMensagem.ATENCAO],
		[assunto: "Data Indisponãvel Adicionada na Agenda",
			corpo: "O médico João Ninguém estará indisponível na data: 23/03 durante o dia inteiro.", 
			dataEnvio: new Date(), tipo:TipoMensagem.ERRO],
	]

	def tarefas = [
		[nome:"Nome da tarefa", descricao:"Você deve fazer isto", 
			dataCriacao: new Date(), status: StatusTarefa.PENDENTE],
		[nome:"Nome da tarefa", descricao:"Você deve fazer isto", 
			dataCriacao: new Date(), status: StatusTarefa.PENDENTE],
		[nome:"Nome da tarefa", descricao:"Você deve fazer isto",
			dataCriacao: new Date(), status: StatusTarefa.PENDENTE],
		[nome:"Nome da tarefa", descricao:"Você deve fazer isto",
			dataCriacao: new Date(), status: StatusTarefa.PENDENTE]
	]

	def exames = [
		[nome:"Radiografia", descricao:"descricao do exame", preco:50.00],
		[nome:"Ultrasonografia", descricao:"descricao do exame", preco:50.00],
		[nome:"Sangue", descricao:"descricao do exame", preco:50.00],
		[nome:"Tomografia", descricao:"descricao do exame", preco:50.00],
		[nome:"Mamografia", descricao:"descricao do exame", preco:50.00]
	]


	def init = { servletContext ->
		log.info "Iniciando Aplicação"

		switch(GrailsUtil.environment) {
			case "test":
			case "development":
				inicializaPlanosSaude()
				inicializaEnderecos()
				inicializaPacientes()
				inicializaAtendentes()
				inicializaEspecialidades()
				inicializaMedicos()
				inicializaPerfis()
				definePerfis()
//				inicializaConsultas()
				inicializaMensagens()
//				inicializaAtendimentos()
	//				inicializaTarefas()
//				inicializaExames()
				break
			case "homolog":
				inicializaPlanosSaude()
				inicializaEnderecos()
				inicializaPacientes()
				inicializaAtendentes()
				inicializaEspecialidades()
				inicializaMedicos()
				inicializaPerfis()
				definePerfis()
				inicializaConsultas()
				inicializaMensagens()
				inicializaAtendimentos()
//				inicializaTarefas()
				inicializaExames()
				break
			case "production":
				inicializaPlanosSaude()
				inicializaEnderecos()
				inicializaPacientes()
				inicializaAtendentes()
				inicializaEspecialidades()
				inicializaMedicos()
				inicializaPerfis()
				definePerfis()
//				inicializaConsultas()
//				inicializaMensagens()
//				inicializaAtendimentos()
//				inicializaTarefas()
//				inicializaExames()
				break
		}
	}

	Random rand = new Random()
	def inicializaPlanosSaude = {
		log.info "Inicializando Planos de Saúde"
		planosSaude.each{planoSaude ->
			def planoSaudeInstancia = new PlanoSaude(nome:planoSaude.nome, tipo:planoSaude.tipo, validade:planoSaude.validade, numero:planoSaude.numero)
			log.info "Plano: " + planoSaudeInstancia.save().nome
		}
		sessionFactory.getCurrentSession().flush()
	}

	def inicializaEnderecos = {
		log.info "Inicializando Enderecos"
		enderecos.each{endereco ->
			def enderecoInstancia = new Endereco(rua:endereco.rua,cep:endereco.cep, numero:endereco.numero, complemento:endereco.complemento, cidade:endereco.cidade, estado:endereco.estado)
			log.info "Endereco: " + enderecoInstancia.save().rua
		}
		sessionFactory.getCurrentSession().flush()
	}

	def inicializaPacientes = {
		log.info "Inicializando Pacientes"
		def pacienteInstancia
		pacientes.each{paciente ->
			pacienteInstancia = new Paciente(nome:paciente.nome, idade:paciente.idade, documento:paciente.documento,
					telefone:paciente.telefone, sexo:paciente.sexo, dataNascimento:paciente.dataNascimento,
					senha:paciente.password, login:paciente.login, email:paciente.email, ativo:true,  historico:paciente.historico,
					planoSaude:PlanoSaude.list().get(0), endereco:Endereco.list().get(0))
			log.info "Paciente: " + pacienteInstancia.save().nome
		}
		sessionFactory.getCurrentSession().flush()
	}

	def inicializaAtendentes = {
		log.info "Inicializando Atendentes"
		atendentes.each{atendente ->
			def atendenteInstancia = new Atendente(nome:atendente.nome, idade:atendente.idade, documento:atendente.documento,
					telefone:atendente.telefone, sexo:atendente.sexo, dataNascimento:atendente.dataNascimento,
					endereco:Endereco.list().get(0), senha:atendente.password, login:atendente.login, email:atendente.email, ativo:true, turno:atendente.turno)
			log.info "Atendente: " + atendenteInstancia.save().nome
		}
		sessionFactory.getCurrentSession().flush()
	}
	
	def inicializaEspecialidades = {
		log.info "Inicializando Especialidades"
		especialidades.each{especialidade ->
			def especialidadeInstancia = new Especialidade(nome:especialidade.nome, descricao:especialidade.descricao)
			log.info "Especialidade: " + especialidadeInstancia.save().nome
		}
		sessionFactory.getCurrentSession().flush()
	}

	def inicializaMedicos = {
		log.info "Inicializando Médicos"
		medicos.each{medico ->
			def medicoInstancia = new Medico(nome:medico.nome, idade:medico.idade, documento:medico.documento, 
					telefone:medico.telefone, precoConsulta:medico.preco, sexo:medico.sexo, dataNascimento:medico.dataNascimento,
					endereco:Endereco.list().get(0), senha:medico.password, login:medico.login, email:medico.email,
					ativo:true, crm:medico.crm, agenda: medico.agenda, especialidade: Especialidade.list().get(rand.nextInt(Especialidade.count())))
			log.info "Médico: " +  medicoInstancia.save().nome
		}
		sessionFactory.getCurrentSession().flush()
	}


	def inicializaPerfis = {
		log.info "Inicializando Perfis"
		perfis.each{perfil ->
			def perfilInstancia = new Perfil(authority:perfil.authority)
			log.info "Perfil: " + perfilInstancia.save().authority
		}
		sessionFactory.getCurrentSession().flush()
	}

	def definePerfis = {
		log.info "Definindo Perfis"
		UsuarioPerfil.create(Usuario.findByLoginIlike("%paciente%"), Perfil.findByAuthorityIlike("%PACIENTE%"))
		UsuarioPerfil.create(Usuario.findByLoginIlike("%medico%"), Perfil.findByAuthorityIlike("%MEDICO%"))
		UsuarioPerfil.create(Usuario.findByLoginIlike("%atendente%"), Perfil.findByAuthorityIlike("%ATENDENTE%"))
		
		Usuario.list().each{usuario ->
			if(usuario.login != "paciente" && usuario.login != "medico" && usuario.login != "atendente"){
				if(usuario.class == Paciente.class){
					UsuarioPerfil.create(usuario,  Perfil.findWhere(authority:"ROLE_PACIENTE"))
				}
				if(usuario.class == Medico.class){
					UsuarioPerfil.create(usuario,  Perfil.findWhere(authority:"ROLE_MEDICO"))
				}
				if(usuario.class == Atendente.class){
					UsuarioPerfil.create(usuario,  Perfil.findWhere(authority:"ROLE_ATENDENTE"))
				}
			}
		}
		
		sessionFactory.getCurrentSession().flush()
	}
	
	def inicializaConsultas = {
		log.info "Inicializando Consultas"
		for (i in 0..9){
			def medico = Medico.list().get(rand.nextInt(Medico.count()))
			def paciente = Paciente.list().get(rand.nextInt(Paciente.count()))
			def params = new HashMap()
			params['consulta'] = new HashMap()
			params['consulta'].'medico' = new HashMap()
			params['consulta'].'paciente' = new HashMap()
			params['consulta'].'medico'?.'id' = medico.id.toString()
			params['consulta'].'paciente'?.'id' = paciente.id.toString()
			params['consulta'].'data' = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(new Date())
			try{
				def consultaInstancia = consultaService.criaConsulta(params, StatusConsulta.PENDENTE)
				sessionFactory.getCurrentSession().flush()
				Thread.sleep(1000)
				log.info "Consulta: " + consultaInstancia.medico.nome
			}catch(ConsultationLimitException e){
				log.info e.message
			}
		}
	}

	def inicializaAtendimentos = {
		log.info "Inicializando Atendimentos"
			atendimentos.each{atendimento ->
				def consulta = Consulta.list().get(rand.nextInt(Consulta.count()))
				def paciente = consulta.paciente
				def atendimentoInstancia = new Atendimento(status:atendimento.status, data:atendimento.data, 
					paciente:paciente, pago:atendimento.pago, 
					precoTotal:consulta.medico.precoConsulta, consulta:consulta)
				atendimentoInstancia.setPaciente(paciente)
				atendimentoInstancia.save()
				log.info "Atendimento: " + atendimentoInstancia.status
//				Thread.sleep(1000)
			}
		sessionFactory.getCurrentSession().flush()
	}
	
	def inicializaMensagens = {
		log.info "Inicializando Mensagens"
		Consulta.findAll().each{mensagem ->
			for(atendente in Atendente.list()){
				mensagemService.consultaMarcada(atendente)
			}
		}
		sessionFactory.getCurrentSession().flush()
	}

	def inicializaTarefas = {
		log.info "Inicializando Tarefas"
			tarefas.each{tarefa ->
				def usuarioInstancia = Atendente.list().get(rand.nextInt(Atendente.count()))
				def tarefaInstancia = new Tarefa(
						nome:tarefa.nome, descricao:tarefa.descricao, 
						dataCriacao: tarefa.dataCriacao, status: tarefa.status, 
						atendimento:Consulta.list().get(rand.nextInt(Consulta.count())))
				log.info "Tarefa: " + tarefaInstancia.save().nome
				usuarioInstancia.addToTarefas(tarefaInstancia)
			}
		sessionFactory.getCurrentSession().flush()
	}


	def inicializaExames = {
		log.info "Inicializando Exames"
		exames.each{exame ->
			def atendimentoInstancia = Atendimento.list().get(rand.nextInt(Atendimento.count()))
			def exameInstancia = new Exame(nome:exame.nome, descricao:exame.descricao, preco:exame.preco)
			log.info "Exame: " + exameInstancia.save().nome
			atendimentoInstancia.precoTotal += exameInstancia.preco
			atendimentoInstancia.addToExames(exameInstancia)
			atendimentoInstancia.save()
		}
		sessionFactory.getCurrentSession().flush()
	}

	def destroy = {
	}
}
