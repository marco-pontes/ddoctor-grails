package ddoctor

class AtendimentoService {
	def springSecurityService
	def mensagemService
	def tarefaService
    static transactional = true
	
	/**
	* Busca o historico de atendimentos do paciente.
	* @param ddoctor.usuario.Usuario
	* @param org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
	* @return List<Atendimento>
	*/
	def buscaAtendimentosAnteriores(usuario){
		def query = """ select atendimentos
							from Atendimento as atendimentos
								where atendimentos.paciente.id = :idUsuario
									and atendimentos.status = :statusAtendimento
									order by atendimentos.data asc"""
		def listaAtendimentos = Atendimento.executeQuery(query, 
			[idUsuario:usuario.id, statusAtendimento:StatusAtendimento.FINALIZADO])
		return listaAtendimentos
	}
	
	/**
	* Cria um novo atendimento com o status AGUARDANDO_CHEGADA, baseado na consulta recebida.
	* @param ddoctor.Consulta
	* @return ddoctor.Atendimento
	*/
	def criaAtendimento(Consulta consulta){
		def atendimentoInstancia = new Atendimento()
		atendimentoInstancia.paciente = consulta.paciente
		atendimentoInstancia.status = StatusAtendimento.AGUARDANDO_CHEGADA
		atendimentoInstancia.pago = true //assumir que a consulta s� � criada depois de paga.
		atendimentoInstancia.precoTotal = consulta.medico.precoConsulta
		atendimentoInstancia.consulta = consulta
		return atendimentoInstancia.save(flush:true)
	}
	
	/**
	* Busca os atendimentos de um paciente específico.
	* @param java.lang.String idPaciente
	* @return List<ddoctor.Atendimento>
	*/	
	def buscaAtendimentosPorPaciente(idPaciente) {
		def atendimentos
		def query = """		select a
								from Atendimento a
									   join a.consulta as c
									   join c.paciente as p
										where p.id = :idPaciente
										and a.status = :statusAtendimento
										order by c.data desc"""
		atendimentos = Atendimento.executeQuery(query,[idPaciente:idPaciente, statusAtendimento:StatusAtendimento.AGUARDANDO_CHEGADA, max:4])
		return atendimentos
	}
	
	/**
	* Busca os atendimentos de status específico.
	* @param java.lang.String idPaciente
	* @return List<ddoctor.Atendimento>
	*/
	def buscaAtendimentosPorStatus(StatusAtendimento status) {
		def query = "select a from Atendimento a join a.consulta as c where a.status = :statusAtendimento order by c.data desc"
		def atendimentos = Atendimento.executeQuery(query,[statusAtendimento:status, max:4])
		return atendimentos
	}
	
	/**
	* Agrupa os valores de atendimentos anteriores por dia
	* @param java.util.ArrayList<atendimentos>
	* @return List<ddoctor.Atendimento>
	*/
	def agrupaAtendimentosPorDia(ArrayList<Atendimento> atendimentos){
		def atendimentosInfo = []
		HashSet hs = new HashSet();
		hs.addAll(atendimentos.data.date);
		for(dia in hs){
			def atendimentosDia = atendimentos.findAll{it.data.date == dia}
			def valor = 0.0
			def data
			for (atendimento in atendimentosDia) {
				data = atendimento.data
				valor += atendimento.precoTotal
			}
			def atendimentoInfo = [:]
			atendimentoInfo.'data' = data
			atendimentoInfo.'valor' = valor
			atendimentosInfo.add(atendimentoInfo)
		}
		return atendimentosInfo	
	}
	
	def buscaAtendimentosPorPeriodo(String periodo) {
		def dataInicial = new Date()
		def dataFinal = new Date()
		dataFinal.setHours 23
		dataFinal.setMinutes 59
		dataFinal.setSeconds 59
		switch (periodo){
			case "dia" :
				dataFinal =  new Date().plus(1)
				break
			case "semana" :
				dataFinal.plus (dataInicial.day + 7)
				break
			case "mes" :
				dataFinal.setMonth(dataInicial.month + 1)
				break
			default :
				log.info "default...."
				break
		}
		def atendimentos = Atendimento.findAllByDataBetween(dataInicial, dataFinal)
		return atendimentos
	}
	
	def buscaAtendimentosMedico(medico, status) {
		def atendimentos
		def query = """	select a
							from Atendimento a
								   join a.consulta as c
								   join c.medico as m
									where m.id = :idMedico
									and a.status = :status"""
		atendimentos = Atendimento.executeQuery(query,[idMedico:medico.id, status: status])
		return atendimentos
	}
}
