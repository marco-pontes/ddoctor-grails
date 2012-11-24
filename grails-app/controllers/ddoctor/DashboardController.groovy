package ddoctor

import ddoctor.usuario.Usuario;
//import ddoctor.usuario.UsuarioController;
import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class DashboardController { //extends UsuarioController {

	def springSecurityService
	def dashboardService
	def atendimentoService
	def consultaService
	def tarefaService
	def mensagemService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def afterInterceptor = { model, modelAndView ->
		log.info "View ${modelAndView?.viewName}"
		model.usuario = springSecurityService.getCurrentUser()
		model.perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
	}
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def index = {
		session.local = "pt-BR"
		if(session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first() == "ROLE_PACIENTE"){
			redirect(controller:"dashboard", action:"paciente")
			return
		}
		if(session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first() == "ROLE_MEDICO"){
			redirect(controller:"dashboard", action:"medico")
			return
		}
		if(session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first() == "ROLE_ATENDENTE"){
			redirect(controller:"dashboard", action:"atendente")
			return
		}
	}

	@Secured(['ROLE_ATENDENTE'])
	def atendente () {
		def usuarioInstancia = springSecurityService.getCurrentUser()
		def atendimentosMes = atendimentoService.buscaAtendimentosPorPeriodo("mes")
		def atendimentosHoje = atendimentoService.buscaAtendimentosPorPeriodo("dia")
		def atendimentosAguardandoChegada = atendimentoService.buscaAtendimentosPorStatus(StatusAtendimento.AGUARDANDO_CHEGADA)
		def consultasAguardandoConfirmacao = consultaService.buscaConsultasPorStatus(StatusConsulta.PENDENTE)
		def listaMensagens
		def listaTarefas
		if(springSecurityService.getCurrentUser()){
			listaMensagens = mensagemService.buscaMensagens(usuarioInstancia)
			listaTarefas = tarefaService.buscaTarefasPorStatus(usuarioInstancia, StatusTarefa.PENDENTE)
		}
		render(view: "atendente", model:[listaMensagens:listaMensagens, atendimentosMes:atendimentosMes, atendimentosHoje:atendimentosHoje, 
			listaTarefas:listaTarefas, atendimentosAguardandoChegada: atendimentosAguardandoChegada, 
			consultasAguardandoConfirmacao:consultasAguardandoConfirmacao])
	}

	@Secured(['ROLE_MEDICO'])
	def medico () {
		def usuarioInstancia = springSecurityService.getCurrentUser()
		def consultasFinalizadas = atendimentoService.buscaAtendimentosMedico(usuarioInstancia, StatusAtendimento.FINALIZADO)
		def proximosAtendimentos = atendimentoService.buscaAtendimentosMedico(usuarioInstancia, StatusAtendimento.AGUARDANDO_ATENDIMENTO)
		def listaMensagens
		listaMensagens = mensagemService.buscaMensagens(usuarioInstancia)
		render(view: "medico", model:[listaMensagens:listaMensagens, consultasFinalizadas:consultasFinalizadas, proximosAtendimentos:proximosAtendimentos])
	}

	@Secured(['ROLE_PACIENTE'])
	def paciente (){
		def usuarioInstancia = springSecurityService.getCurrentUser()
		def consultasNaoConfirmadas = consultaService.buscaConsultasPorUsuario(usuarioInstancia, StatusConsulta.PENDENTE)
		def proximasConsultas = consultaService.buscaConsultasPorUsuario(usuarioInstancia, StatusConsulta.CONFIRMADA)
		def atendimentosAnteriores = atendimentoService.buscaAtendimentosAnteriores(usuarioInstancia)
		def graficoAtendimentosAnteriores = atendimentoService.agrupaAtendimentosPorDia(atendimentosAnteriores)
		def listaMensagens
		log.info proximasConsultas
		listaMensagens = mensagemService.buscaMensagens(usuarioInstancia)
		render(view: "paciente", 
			model:[listaMensagens:listaMensagens, atendimentosAnteriores:atendimentosAnteriores, 
				pacienteInstancia:usuarioInstancia, proximasConsultas:proximasConsultas,
				graficoAtendimentosAnteriores:graficoAtendimentosAnteriores,
				consultasNaoConfirmadas:consultasNaoConfirmadas])
	}

}

