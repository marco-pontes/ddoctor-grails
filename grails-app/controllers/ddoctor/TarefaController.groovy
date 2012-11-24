package ddoctor

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED', 'ROLE_ATENDENTE'])
class TarefaController {
	def springSecurityService
	def tarefaService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def afterInterceptor = { model, modelAndView ->
		log.debug "View ${modelAndView?.viewName}"
		model.usuario = springSecurityService.getCurrentUser()
		model.perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
	}

    def index() {
        redirect(action: "listar", params: params)
    }

    def listar() {
		def usuarioInstancia = springSecurityService.getCurrentUser()
		def listaTarefas = tarefaService.buscaTarefasPorStatus(usuarioInstancia, StatusTarefa.PENDENTE)
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if (listaTarefas.size() == 0){
			flash.mensagem = message(code: 'no.tasks.message')
		}
        [tarefaInstanciaList: listaTarefas, tarefaInstanciaTotal: listaTarefas.size() ]
    }
	
	def inicializaModalDetalhes () {
		def tarefaInstancia = Tarefa.get(params["tarefa"].'id')
		render (template:"modalDetalhes", model: [tarefaInstancia: tarefaInstancia])
	}

    def create() {
        [tarefaInstancia: new Tarefa(params)]
    }

    def save() {
        def tarefaInstancia = new Tarefa(params)
        if (!tarefaInstancia.save(flush: true)) {
            render(view: "create", model: [tarefaInstancia: tarefaInstancia])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), tarefaInstancia.id])
        redirect(action: "show", id: tarefaInstancia.id)
    }

    def show() {
        def tarefaInstancia = Tarefa.get(params.id)
        if (!tarefaInstancia) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), params.id])
            redirect(action: "listar")
            return
        }

        [tarefaInstancia: tarefaInstancia]
    }

    def edit() {
        def tarefaInstancia = Tarefa.get(params.id)
        if (!tarefaInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), params.id])
            redirect(action: "listar")
            return
        }

        [tarefaInstancia: tarefaInstancia]
    }

    def update() {
        def tarefaInstancia = Tarefa.get(params.id)
        if (!tarefaInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), params.id])
            redirect(action: "listar")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tarefaInstancia.version > version) {
                tarefaInstancia.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tarefa.label', default: 'Tarefa')] as Object[],
                          "Another user has updated this Tarefa while you were editing")
                render(view: "edit", model: [tarefaInstancia: tarefaInstancia])
                return
            }
        }

        tarefaInstancia.properties = params

        if (!tarefaInstancia.save(flush: true)) {
            render(view: "edit", model: [tarefaInstancia: tarefaInstancia])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), tarefaInstancia.id])
        redirect(action: "show", id: tarefaInstancia.id)
    }

    def delete() {
        def tarefaInstancia = Tarefa.get(params.id)
        if (!tarefaInstancia) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), params.id])
            redirect(action: "listar")
            return
        }

        try {
            tarefaInstancia.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), params.id])
            redirect(action: "listar")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tarefa.label', default: 'Tarefa'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
