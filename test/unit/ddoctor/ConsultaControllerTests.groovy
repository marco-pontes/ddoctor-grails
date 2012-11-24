package ddoctor



import org.junit.*
import grails.test.mixin.*

@TestFor(ConsultaController)
@Mock(Consulta)
class ConsultaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/consulta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.consultaInstanceList.size() == 0
        assert model.consultaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.consultaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.consultaInstance != null
        assert view == '/consulta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/consulta/show/1'
        assert controller.flash.message != null
        assert Consulta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/consulta/list'


        populateValidParams(params)
        def consulta = new Consulta(params)

        assert consulta.save() != null

        params.id = consulta.id

        def model = controller.show()

        assert model.consultaInstance == consulta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/consulta/list'


        populateValidParams(params)
        def consulta = new Consulta(params)

        assert consulta.save() != null

        params.id = consulta.id

        def model = controller.edit()

        assert model.consultaInstance == consulta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/consulta/list'

        response.reset()


        populateValidParams(params)
        def consulta = new Consulta(params)

        assert consulta.save() != null

        // test invalid parameters in update
        params.id = consulta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/consulta/edit"
        assert model.consultaInstance != null

        consulta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/consulta/show/$consulta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        consulta.clearErrors()

        populateValidParams(params)
        params.id = consulta.id
        params.version = -1
        controller.update()

        assert view == "/consulta/edit"
        assert model.consultaInstance != null
        assert model.consultaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/consulta/list'

        response.reset()

        populateValidParams(params)
        def consulta = new Consulta(params)

        assert consulta.save() != null
        assert Consulta.count() == 1

        params.id = consulta.id

        controller.delete()

        assert Consulta.count() == 0
        assert Consulta.get(consulta.id) == null
        assert response.redirectedUrl == '/consulta/list'
    }
}
