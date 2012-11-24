package ddoctor

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED', 'ROLE_MEDICO', 'ROLE_ATENDENTE'])
class PacienteController {
	def springSecurityService
	def medicoService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	
	def afterInterceptor = { model, modelAndView ->
		log.debug "View ${modelAndView?.viewName}"
		model.usuario = springSecurityService.getCurrentUser()
		model.perfil = session.SPRING_SECURITY_CONTEXT?.authentication?.authorities.first()
	}

    def listar() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pacienteInstanciaList: Paciente.list(params), pacienteInstanciaTotal: Paciente.count()]
    }
	
	def autocompleteNomes() {
		def listaPacientes
		listaPacientes = Paciente.findAllByNomeIlike("%${params.term}%")
		render listaPacientes as JSON
	}


}
