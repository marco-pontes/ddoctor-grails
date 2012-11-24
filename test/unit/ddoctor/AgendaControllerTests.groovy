package ddoctor



import org.junit.*
import grails.test.mixin.*

@TestFor(AgendaController)
@Mock(Agenda)
class AgendaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/agenda/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.agendaInstanceList.size() == 0
        assert model.agendaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.agendaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.agendaInstance != null
        assert view == '/agenda/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/agenda/show/1'
        assert controller.flash.message != null
        assert Agenda.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/agenda/list'


        populateValidParams(params)
        def agenda = new Agenda(params)

        assert agenda.save() != null

        params.id = agenda.id

        def model = controller.show()

        assert model.agendaInstance == agenda
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/agenda/list'


        populateValidParams(params)
        def agenda = new Agenda(params)

        assert agenda.save() != null

        params.id = agenda.id

        def model = controller.edit()

        assert model.agendaInstance == agenda
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/agenda/list'

        response.reset()


        populateValidParams(params)
        def agenda = new Agenda(params)

        assert agenda.save() != null

        // test invalid parameters in update
        params.id = agenda.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/agenda/edit"
        assert model.agendaInstance != null

        agenda.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/agenda/show/$agenda.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        agenda.clearErrors()

        populateValidParams(params)
        params.id = agenda.id
        params.version = -1
        controller.update()

        assert view == "/agenda/edit"
        assert model.agendaInstance != null
        assert model.agendaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/agenda/list'

        response.reset()

        populateValidParams(params)
        def agenda = new Agenda(params)

        assert agenda.save() != null
        assert Agenda.count() == 1

        params.id = agenda.id

        controller.delete()

        assert Agenda.count() == 0
        assert Agenda.get(agenda.id) == null
        assert response.redirectedUrl == '/agenda/list'
    }
}
