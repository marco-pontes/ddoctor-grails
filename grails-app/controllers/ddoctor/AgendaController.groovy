package ddoctor

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataIntegrityViolationException

class AgendaController {
	
	def springSecurityService
	def afterInterceptor = { model, modelAndView ->
		log.info "View ${modelAndView?.viewName}"
		model.usuario = springSecurityService.getCurrentUser()
		model.perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
	}
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
//    def index() {
//        redirect(action: "list", params: params)
//    }

    def inicializaModalAgenda() {
		def medicoInstancia = Medico.get(params.id)
		def perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
        if (!medicoInstancia) {
			flash.message = message(code: 'default.not.found.message')
        }
		render(template:"mostrar", model:[medicoInstancia:medicoInstancia, perfil:perfil])
    }

}
