package ddoctor

class Agenda {
	
	static hasMany = [consultas:Consulta]
	static belongsTo = Medico
    static constraints = {
		consultas(nullable:true)
    }
}
