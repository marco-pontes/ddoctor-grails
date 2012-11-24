package ddoctor
import org.springframework.dao.DataIntegrityViolationException
class MedicacaoController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def index() {
        redirect(action: "list", params: params)
    }
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medicacaoInstanciaList: Medicacao.list(params), medicacaoInstanciaTotal: Medicacao.count()]
    }
    def create() {
        [medicacaoInstancia: new Medicacao(params)]
    }
    def save() {
        def medicacaoInstancia = new Medicacao(params)
        if (!medicacaoInstancia.save(flush: true)) {
            render(view: "create", model: [medicacaoInstancia: medicacaoInstancia])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), medicacaoInstancia.id])
        redirect(action: "show", id: medicacaoInstancia.id)
    }
    def show(Long id) {
        def medicacaoInstancia = Medicacao.get(id)
        if (!medicacaoInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), id])
            redirect(action: "list")
            return
        }
        [medicacaoInstancia: medicacaoInstancia]
    }
    def edit(Long id) {
        def medicacaoInstancia = Medicacao.get(id)
        if (!medicacaoInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), id])
            redirect(action: "list")
            return
        }
        [medicacaoInstancia: medicacaoInstancia]
    }
    def update(Long id, Long version) {
        def medicacaoInstancia = Medicacao.get(id)
        if (!medicacaoInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), id])
            redirect(action: "list")
            return
        }
        if (version != null) {
            if (medicacaoInstancia.version > version) {
                medicacaoInstancia.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'medicacao.label', default: 'Medicacao')] as Object[],
                          "Another user has updated this Medicacao while you were editing")
                render(view: "edit", model: [medicacaoInstancia: medicacaoInstancia])
                return
            }
        }
        medicacaoInstancia.properties = params
        if (!medicacaoInstancia.save(flush: true)) {
            render(view: "edit", model: [medicacaoInstancia: medicacaoInstancia])
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), medicacaoInstancia.id])
        redirect(action: "show", id: medicacaoInstancia.id)
    }
    def delete(Long id) {
        def medicacaoInstancia = Medicacao.get(id)
        if (!medicacaoInstancia) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), id])
            redirect(action: "list")
            return
        }
        try {
            medicacaoInstancia.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medicacao.label', default: 'Medicacao'), id])
            redirect(action: "show", id: id)
        }
    }
}