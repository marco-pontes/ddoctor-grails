package ddoctor

import java.util.List;

class TarefaService {
	
	/**
	* Usada para criar uma tarefa de copnfirmação de consulta para um atendente.
	* @param {@link ddoctor.usuario.Usuario}
	* @param {@link ddoctor.Consulta}
	*/
    def criaTarefaConfirmacaoConsulta(usuario, Consulta consulta) {
		def tarefaInstancia = new Tarefa()
		tarefaInstancia.nome = "Confirmar Nova Consulta"
		tarefaInstancia.status = StatusTarefa.PENDENTE
		tarefaInstancia.descricao = "Existe uma nova consulta marcada por um paciente e precisa ser confirmada."
		tarefaInstancia.dataCriacao = new Date()
		tarefaInstancia.consulta = consulta
		tarefaInstancia.save()
		usuario.addToTarefas(tarefaInstancia)
    }	
	
	/**
	* Usada para recuperar as tarefas de um determinado status.
	* @param ddoctor.usuario.Usuario
	* @param {@link ddoctor.StatusTarefa}
	* @return {@link List}<Tarefa>
	*/
	def buscaTarefasPorStatus(usuario, StatusTarefa status){
		def query = "select t from Usuario as u join u.tarefas t where t.status = :status and u.id = :idUsuario order by t.dataCriacao desc"
		def listaTarefas = Atendimento.executeQuery(query, [status:status, idUsuario:usuario.id], [max:4])
		return listaTarefas
	}
}
