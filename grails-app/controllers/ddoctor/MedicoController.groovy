package ddoctor

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class MedicoController {
	def springSecurityService
	def medicoService
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
        params.max = 2
        [medicoInstanciaList: Medico.list(params), medicoInstanciaTotal: Medico.count()]
    }
	
	def buscaMedicosPorEspecialidade() {
		def especialidade = Especialidade.get(params["especialidade"].'id')
		def medicos = Medico.findAllWhere(especialidade:especialidade)
		render medicos as JSON
	}
	
	def buscaAgendaMedico() {
		def medico = Medico.get(params["medico"].'id')
		def resposta = new HashMap<String, String>()
		def consultas = medico.agenda.consultas.findAll{it.status == StatusConsulta.CONFIRMADA}
		if(consultas){
			resposta.consultas = consultas
			resposta.mensagem = message(code: 'get.agenda.success.message')
			resposta.codigo = Constantes.SUCESSO
		}
		else{
			resposta.mensagem = message(code: 'get.agenda.fail.message')
			resposta.codigo = Constantes.SEM_RESULTADOS
		}
		render resposta as JSON
	}
	
	def autocompleteNomes() {
		def medicos
		medicos = Medico.findAllByNomeIlike("%${params.term}%")
		def listaInfoMedicos = []
		medicos.each{medico ->
			def infoMedico = [:]
			infoMedico."id" = medico.id
			infoMedico."nome" = medico.nome
			infoMedico."especialidade" = medico.especialidade.nome
			listaInfoMedicos.add(infoMedico)
		}
		render listaInfoMedicos as JSON
	}
	

}