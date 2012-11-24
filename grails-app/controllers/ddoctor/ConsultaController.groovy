package ddoctor

import ddoctor.exceptions.ConsultationLimitException;
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class ConsultaController {
	def consultaService
	def atendimentoService
	def springSecurityService
	def mensagemService
	def medicoService
	
	def afterInterceptor = { model, modelAndView ->
		log.debug "View ${modelAndView?.viewName}"
		model.usuario = springSecurityService.getCurrentUser()
		model.perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
	}
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [consultaInstanciaList: Consulta.list(params), consultaInstanciaTotal: Consulta.count()]
    }
	
	def entrevistaMedica() {
		def entrevistaInstancia = new EntrevistaMedica()
		entrevistaInstancia.properties = params
		def atendimentoInstancia = Atendimento.get(params['atendimento'].'id')
		if(atendimentoInstancia){
			atendimentoInstancia.status = StatusAtendimento.EM_ATENDIMENTO
			atendimentoInstancia.save(flush:true)
			[entrevistaInstancia: entrevistaInstancia, atendimentoId:params['atendimento'].'id']
		}
		else{
			redirect(controller:"dashboard")
		}
	}

	def salvarEntrevista() {
		def entrevistaInstancia = new EntrevistaMedica(params['entrevista'])
		def atendimentoInstancia = Atendimento.get(params['atendimento'].'id')
		atendimentoInstancia.status = StatusAtendimento.FINALIZADO
		entrevistaInstancia.save(flush: true)
		if (entrevistaInstancia.validate()) {
			atendimentoInstancia.consulta.entrevistaMedica = entrevistaInstancia
			atendimentoInstancia.consulta.status = StatusConsulta.FINALIZADA
			atendimentoInstancia.save(flush:true)
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'entrevista.label', default: 'Consulta'), entrevistaInstancia.id])}"
			redirect(action: "list")
		}
		else {
			flash.message = "${message(code: 'entrevista.validation.fail.message')}"
			render(view: "entrevistaMedica", model: 
				[entrevistaInstancia: entrevistaInstancia, atendimentoId:atendimentoInstancia.id])
		}
	}

    def criar() {
        [consultaInstancia: new Consulta(params)]
    }

    def salvar() {
		def resposta = [:]
		def consultaInstancia
		def especialidadesMedicosDisponiveis
		flash.mensagem = new HashMap()
		try{
			consultaInstancia = consultaService.criaConsulta(params, StatusConsulta.PENDENTE)
	        if (consultaInstancia.hasErrors()) {
				flash.mensagem.'texto' = message(code: 'create.consultation.fail.message')
				flash.mensagem.'tipo' = Constantes.MENSAGEM_ERRO
				resposta.msg = message(code: 'create.consultation.fail.message')
				resposta.cod = Constantes.ERRO
	        }
			else{
				flash.mensagem.'texto' = message(code: 'create.consultation.success.message')
				flash.mensagem.'tipo' = Constantes.MENSAGEM_SUCESSO
				resposta.msg = message(code: 'create.consultation.success.message')
				resposta.cod = Constantes.SUCESSO
			}
		}
		catch(ConsultationLimitException e){
			flash.mensagem.texto =  "${message(code: 'create.consultation.duplicate.message')}"
			flash.mensagem.tipo = Constantes.MENSAGEM_ERRO
			resposta.msg = message(code: 'create.consultation.duplicate.message')
			resposta.cod = Constantes.ERRO
		}
		finally{
			especialidadesMedicosDisponiveis = medicoService.buscaEspecialidadesComMedicos()
			resposta.html = g.render(template: "/consulta/criar", model: [consultaInstancia: consultaInstancia, usuario:springSecurityService.getCurrentUser(), especialidadesMedicosDisponiveis:especialidadesMedicosDisponiveis])
			render resposta as JSON
		}
	}

	def mostrar() {
		def tarefaInstancia
		def consultaInstancia = Consulta.get(params.id)
		if(params["tarefa"]){
			tarefaInstancia = Tarefa.get(params["tarefa"].id)
		}
		if (!consultaInstancia) {
			redirect(controller:"atendimento", action: "listar")
			return
		}
		[tarefaInstancia: tarefaInstancia, consultaInstancia: consultaInstancia]

	}
	
	def confirmar() {
		def tarefaInstancia = Tarefa.get(params["tarefa"].id)
		def consultaInstancia = Consulta.get(params.id)
		consultaInstancia.status = StatusConsulta.CONFIRMADA
		tarefaInstancia.status = StatusTarefa.FINALIZADA
		if (atendimentoService.criaAtendimento(consultaInstancia)) {
			mensagemService.consultaConfirmada(consultaInstancia)
			flash.mensagem = new HashMap()
			flash.mensagem.'tipo' = Constantes.MENSAGEM_SUCESSO
			flash.mensagem.'texto' = message(code: 'consultation.confirmed.message')
			flash.tipo = TipoMensagem.INFO
			if(params.'irPara' == 'dashboard'){
				redirect(controller:'dashboard')	
				return
			}
			else{
				redirect(action: "mostrar", id: consultaInstancia.id)
				return
			}
		}
		flash.mensagem = new HashMap()
		flash.mensagem.'tipo' = Constantes.MENSAGEM_ERRO
		flash.mensagem.'texto' = message(code: 'consultation.confirmation.error')
		redirect(action: "list")
	}
	
	def cancelar() {
		def tarefaInstancia = Tarefa.get(params["tarefa"].id)
		def consultaInstancia = Consulta.get(params.id)
		consultaInstancia.status = StatusConsulta.CANCELADA
		tarefaInstancia.status = StatusTarefa.FINALIZADA
		flash.mensagem = new HashMap()
		mensagemService.consultaCancelada(consultaInstancia)
		flash.mensagem.texto = message(code: 'consultation.canceled.message')
		flash.mensagem.tipo = Constantes.MENSAGEM_SUCESSO
		redirect(action: "mostrar", id: consultaInstancia.id)
		return
	}
	
	def inicializaModalConsulta(){
		def especialidadesMedicosDisponiveis = medicoService.buscaEspecialidadesComMedicos()
		def perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
		render (template:"criar", model:[consultaInstancia: new Consulta(), 
			especialidadesMedicosDisponiveis: especialidadesMedicosDisponiveis, perfil:perfil, usuario:springSecurityService.getCurrentUser()])
	}

}
