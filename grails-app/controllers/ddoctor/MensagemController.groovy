package ddoctor

import ddoctor.usuario.Usuario
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class MensagemController {
	def mensagemService
	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "listar", params: params)
    }
	
	def inicializaModalDetalhes(){
		def mensagemInstancia = Mensagem.get(params["mensagem"]."id")
		render (template:"modalDetalhes", model: [mensagemInstancia: mensagemInstancia])
	}
	
    def listar() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		Usuario usuario = springSecurityService.getCurrentUser()
		def mensagens = mensagemService.buscaMensagens(usuario)
		def totalInstanciasMensagem = mensagens.size()
		if(totalInstanciasMensagem == 0){
			flash.mensagem = message(code: 'nenhuma.mensagem.message')
		}
        [mensagemInstanciaList: mensagens, totalInstanciasMensagem: totalInstanciasMensagem]
    }
	
    def apagar() {
        def mensagemInstancia = Mensagem.get(params['mensagem'].'id')
		def resposta = [:]
        if (!mensagemInstancia) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), params.id])
            redirect(action: "listar")
            return
        }
		mensagemInstancia.delete(flush: true)
		resposta.code = 1
		resposta.message = message(code: 'default.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), params.id])
        render resposta as JSON
    }

    def create() {
        [mensagemInstancia: new Mensagem(params)]
    }

    def save() {
        def mensagemInstancia = new Mensagem(params)
        if (!mensagemInstancia.save(flush: true)) {
            render(view: "create", model: [mensagemInstancia: mensagemInstancia])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstancia.id])
        redirect(action: "show", id: mensagemInstancia.id)
    }

    def show() {
        def mensagemInstancia = Mensagem.get(params.id)
        if (!mensagemInstancia) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), params.id])
            redirect(action: "listar")
            return
        }

        [mensagemInstancia: mensagemInstancia]
    }

    def edit() {
        def mensagemInstancia = Mensagem.get(params.id)
        if (!mensagemInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), params.id])
            redirect(action: "listar")
            return
        }

        [mensagemInstancia: mensagemInstancia]
    }

    def update() {
        def mensagemInstancia = Mensagem.get(params.id)
        if (!mensagemInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), params.id])
            redirect(action: "listar")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (mensagemInstancia.version > version) {
                mensagemInstancia.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                          "Another user has updated this Mensagem while you were editing")
                render(view: "edit", model: [mensagemInstancia: mensagemInstancia])
                return
            }
        }

        mensagemInstancia.properties = params

        if (!mensagemInstancia.save(flush: true)) {
            render(view: "edit", model: [mensagemInstancia: mensagemInstancia])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstancia.id])
        redirect(action: "show", id: mensagemInstancia.id)
    }

}
