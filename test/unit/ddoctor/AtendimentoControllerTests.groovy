package ddoctor



import org.junit.*
import grails.test.mixin.*

@TestFor(AtendimentoController)
@Mock(Atendimento)
class AtendimentoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/atendimento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.atendimentoInstanceList.size() == 0
        assert model.atendimentoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.atendimentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.atendimentoInstance != null
        assert view == '/atendimento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/atendimento/show/1'
        assert controller.flash.message != null
        assert Atendimento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/atendimento/list'


        populateValidParams(params)
        def atendimento = new Atendimento(params)

        assert atendimento.save() != null

        params.id = atendimento.id

        def model = controller.show()

        assert model.atendimentoInstance == atendimento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/atendimento/list'


        populateValidParams(params)
        def atendimento = new Atendimento(params)

        assert atendimento.save() != null

        params.id = atendimento.id

        def model = controller.edit()

        assert model.atendimentoInstance == atendimento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/atendimento/list'

        response.reset()


        populateValidParams(params)
        def atendimento = new Atendimento(params)

        assert atendimento.save() != null

        // test invalid parameters in update
        params.id = atendimento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/atendimento/edit"
        assert model.atendimentoInstance != null

        atendimento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/atendimento/show/$atendimento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        atendimento.clearErrors()

        populateValidParams(params)
        params.id = atendimento.id
        params.version = -1
        controller.update()

        assert view == "/atendimento/edit"
        assert model.atendimentoInstance != null
        assert model.atendimentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/atendimento/list'

        response.reset()

        populateValidParams(params)
        def atendimento = new Atendimento(params)

        assert atendimento.save() != null
        assert Atendimento.count() == 1

        params.id = atendimento.id

        controller.delete()

        assert Atendimento.count() == 0
        assert Atendimento.get(atendimento.id) == null
        assert response.redirectedUrl == '/atendimento/list'
    }
}
