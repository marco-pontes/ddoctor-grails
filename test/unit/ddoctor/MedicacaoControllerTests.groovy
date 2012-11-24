package ddoctor



import org.junit.*
import grails.test.mixin.*

@TestFor(MedicacaoController)
@Mock(Medicacao)
class MedicacaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medicacao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medicacaoInstanceList.size() == 0
        assert model.medicacaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medicacaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medicacaoInstance != null
        assert view == '/medicacao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medicacao/show/1'
        assert controller.flash.message != null
        assert Medicacao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medicacao/list'

        populateValidParams(params)
        def medicacao = new Medicacao(params)

        assert medicacao.save() != null

        params.id = medicacao.id

        def model = controller.show()

        assert model.medicacaoInstance == medicacao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medicacao/list'

        populateValidParams(params)
        def medicacao = new Medicacao(params)

        assert medicacao.save() != null

        params.id = medicacao.id

        def model = controller.edit()

        assert model.medicacaoInstance == medicacao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medicacao/list'

        response.reset()

        populateValidParams(params)
        def medicacao = new Medicacao(params)

        assert medicacao.save() != null

        // test invalid parameters in update
        params.id = medicacao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medicacao/edit"
        assert model.medicacaoInstance != null

        medicacao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medicacao/show/$medicacao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medicacao.clearErrors()

        populateValidParams(params)
        params.id = medicacao.id
        params.version = -1
        controller.update()

        assert view == "/medicacao/edit"
        assert model.medicacaoInstance != null
        assert model.medicacaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medicacao/list'

        response.reset()

        populateValidParams(params)
        def medicacao = new Medicacao(params)

        assert medicacao.save() != null
        assert Medicacao.count() == 1

        params.id = medicacao.id

        controller.delete()

        assert Medicacao.count() == 0
        assert Medicacao.get(medicacao.id) == null
        assert response.redirectedUrl == '/medicacao/list'
    }
}
