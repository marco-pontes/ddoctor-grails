package ddoctor

import java.util.List;

import ddoctor.exceptions.ConsultationLimitException

class ConsultaService {
	def mensagemService
	def tarefaService

	/**
	 * Cria uma consulta, manda mensagens de aviso e cria tarefas para confirmação recebendo params.
	 * @param java.util.Map
	 * @return ddoctor.Consulta
	 */
	public Consulta criaConsulta(params, status) throws ConsultationLimitException{
		def consultaInstancia = new Consulta()
		def medicoId = params['consulta'].'medico'.'id'
		def pacienteId = params['consulta'].'paciente'.'id'
		def filtroMedico = medicoId?.isInteger()
		def filtroPaciente = pacienteId?.isInteger()
		if(filtroMedico && filtroPaciente){
			def medicoInstancia = Medico.get(Integer.valueOf(medicoId))
			def pacienteInstancia = Paciente.get(Integer.valueOf(pacienteId))
			consultaInstancia.medico = medicoInstancia
			consultaInstancia.paciente = pacienteInstancia
			try{
				if (!params['consulta'].'data'.isEmpty()){
					consultaInstancia.data = params.date('consulta.data')
				}
			}
			catch(MissingMethodException e){
				consultaInstancia.data = new Date().parse("dd/MM/yyyy HH:mm", params['consulta'].'data')
			}
			consultaInstancia.status = status
			if(medicoInstancia && consultaInstancia){
				if(isConsultaDuplicada(medicoInstancia, pacienteInstancia)){
					throw new ConsultationLimitException("O paciente ${pacienteInstancia.nome} já tem uma consulta marcada com o médico ${medicoInstancia.nome}")
				}
			}
			if(consultaInstancia.save()){
				medicoInstancia.agenda.addToConsultas(consultaInstancia)
				mensagemService.consultaMarcada(medicoInstancia)
				if(status == StatusConsulta.PENDENTE){
					tarefaService.criaTarefaConfirmacaoConsulta(medicoInstancia, consultaInstancia)
				}
				for (atendente in Atendente.findAll()){
					mensagemService.consultaMarcada(atendente)
					if(status == StatusConsulta.PENDENTE){
						tarefaService.criaTarefaConfirmacaoConsulta(atendente, consultaInstancia)
					}
				}
			}
		}
		return consultaInstancia
	}

	/**
	 * Busca todas as consultas com um determinado status.
	 * @return List<ddoctor.Consulta>
	 */
	def buscaConsultasPorStatus(StatusConsulta status){
		def query = "select c from Consulta as c where c.status = :status"
		def consultas = Consulta.executeQuery(query, [status:status])
		return consultas
	}

	/**
	 * Busca todas as consultas de um usuario e status específico.
	 * @return List<ddoctor.Consulta>
	 */
	def buscaConsultasPorUsuario(usuario, status){
		def query = """select c
							from Consulta as c
								where c.paciente.id = :usuarioId
								and c.status = :status"""
		def consultas = Consulta.executeQuery(query, [usuarioId:usuario.id, status:status])
		return consultas
	}


	/**
	 * Usado para buscar os atendimentos de um paciente e um médico específico, com status confirmado ou pendente.
	 * Usado para evitar a duplicação de consultas.
	 * @return {@link List}<{@link ddoctor.Consulta}>
	 */
	List<Consulta> buscaConsultas(Medico medico, Paciente paciente){
		def query = """select c
							from Consulta as c
								where c.medico.id = :idMedico
								and c.paciente.id = :idPaciente
								and (c.status = :statusPendente or c.status = :statusConfirmada)"""
		List<Consulta> consultas = Consulta.executeQuery(query, [idMedico:medico.id, idPaciente:paciente.id,
					statusPendente:StatusConsulta.PENDENTE, statusConfirmada:StatusConsulta.CONFIRMADA])
		return consultas
	}

	/**
	 * Usada para verificar se o paciente ja marcou uma consulta com um médico especifico.
	 * @return Boolean
	 */
	Boolean isConsultaDuplicada(Medico medico, Paciente paciente){
		def consultasMarcadas = buscaConsultas(medico, paciente)
		if(consultasMarcadas.size() > 0){
			return true
		}
		else{
			return false
		}
	}


}
