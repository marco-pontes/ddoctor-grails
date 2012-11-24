package ddoctor

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import java.util.Date;

import ddoctor.exceptions.ConsultationLimitException;

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class AtendimentoController {
	def mensagemService
	def tarefaService
	def atendimentoService
	def springSecurityService
	def consultaService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def afterInterceptor = { model, modelAndView ->
		log.debug "View ${modelAndView?.viewName}"
		model.usuario = springSecurityService.getCurrentUser()
		model.perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
	}
	
    def index () {
        redirect(action: "listar", params: params)
    }

    def listar () {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [atendimentoInstanciaList: Atendimento.list(params), atendimentoInstanciaTotal: Atendimento.count()]
    }

    def inicializaModalAtendimento () {
        def atendimentoInstancia = new Atendimento()
        render (template:"criar", model: [atendimentoInstancia: atendimentoInstancia])
    }

    def salvar () {
    	def resposta = [:]
		def consultaInstancia
		flash.mensagem = [:]
		try{
			consultaInstancia = consultaService.criaConsulta(params, StatusConsulta.CONFIRMADA)
			if (consultaInstancia.validate()){
				def atendimentoInstancia = atendimentoService.criaAtendimento(consultaInstancia)
				if(atendimentoInstancia.hasErrors()){
					flash.mensagem.'texto' = message(code: 'create.consultation.fail.message')
					flash.mensagem.'tipo' = Constantes.MENSAGEM_ERRO
					resposta.msg = message(code: 'create.consultation.fail.message')
					resposta.cod = Constantes.ERRO
		        }
		        else{
					flash.mensagem.'texto' = message(code: 'create.consultation.success.message')
					flash.mensagem.'tipo' = Constantes.MENSAGEM_SUCESSO
					resposta.msg = message(code: 'create.consultation.success.message')
					resposta.cod = Constantes.ERRO
		        }
			}
			else{
				flash.mensagem.'texto' = message(code: 'create.consultation.fail.message')
				flash.mensagem.'tipo' = Constantes.MENSAGEM_ERRO
				resposta.msg = message(code: 'create.consultation.fail.message')
				resposta.cod = Constantes.ERRO
			}
	    } catch(ConsultationLimitException e){
			flash.mensagem.'texto' = message(code: 'create.consultation.duplicate.message')
			flash.mensagem.'tipo' = Constantes.MENSAGEM_ERRO
			resposta.msg = message(code: 'create.consultation.duplicate.message')
			resposta.cod = Constantes.ERRO
	    }
		finally{
			resposta.html = g.render(template: "/atendimento/criar", model: [consultaInstancia: consultaInstancia, usuario:springSecurityService.getCurrentUser()])
			render resposta as JSON
		}
    }
	
	def confirmarChegada() {
		def atendimentoInstancia = Atendimento.get(params['atendimento'].id)
		def resultado = [:]
		atendimentoInstancia.status = StatusAtendimento.AGUARDANDO_ATENDIMENTO
		atendimentoInstancia.data = new Date()
		//TODO MUDAR TAREFAS RELACIONADAS
		atendimentoInstancia.save()
		flash.mensagem = new HashMap()
		flash.mensagem.'tipo' = Constantes.MENSAGEM_SUCESSO
		flash.mensagem.texto = message(code: 'atendimento.confirmado.message')
        resultado['status'] = Constantes.SUCESSO
		render resultado as JSON
		return
	}
	
	
    def mostrar() {
        def atendimentoInstancia = Atendimento.get(params.id)
        if (!atendimentoInstancia) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])}"
            redirect(action: "listar")
			return
        }
		[atendimentoInstancia: atendimentoInstancia]
    }
	
	def buscaAtendimentosPorPaciente() {
		def atendimentosAguardandoChegada = atendimentoService.buscaAtendimentosPorPaciente(Long.parseLong(params["paciente"].'id'))
		render (template:"listaAtendimentos", model:[atendimentosAguardandoChegada:atendimentosAguardandoChegada])
	}

    def edit = {
        def atendimentoInstancia = Atendimento.get(params.id)
        if (!atendimentoInstancia) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])}"
            redirect(action: "listar")
        }
        else {
            return [atendimentoInstancia: atendimentoInstancia]
        }
    }

    def update = {
        def atendimentoInstancia = Atendimento.get(params.id)
        if (atendimentoInstancia) {
            if (params.version) {
                def version = params.version.toLong()
                if (atendimentoInstancia.version > version) {
                    
                    atendimentoInstancia.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'atendimento.label', default: 'Atendimento')] as Object[], "Another user has updated this Atendimento while you were editing")
                    render(view: "edit", model: [atendimentoInstancia: atendimentoInstancia])
                    return
                }
            }
            atendimentoInstancia.properties = params
            if (!atendimentoInstancia.hasErrors() && atendimentoInstancia.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), atendimentoInstancia.id])}"
                redirect(action: "mostrar", id: atendimentoInstancia.id)
            }
            else {
                render(view: "edit", model: [atendimentoInstancia: atendimentoInstancia])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])}"
            redirect(action: "listar")
        }
    }

    def delete = {
        def atendimentoInstancia = Atendimento.get(params.id)
        if (atendimentoInstancia) {
            try {
                atendimentoInstancia.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])}"
                redirect(action: "listar")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])}"
                redirect(action: "mostrar", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])}"
            redirect(action: "listar")
        }
    }
}
