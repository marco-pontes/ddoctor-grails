package ddoctor

class MedicoService {
	
	def buscaEspecialidadesComMedicos(){
		def especialidades
		def query = """select m.especialidade from Medico m"""
		especialidades = Medico.executeQuery(query)
		return especialidades
	}

}
