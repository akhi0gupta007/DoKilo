package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Gen_contentController)
@Mock(Gen_content)
class Gen_contentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gen_content/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gen_contentInstanceList.size() == 0
        assert model.gen_contentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.gen_contentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gen_contentInstance != null
        assert view == '/gen_content/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gen_content/show/1'
        assert controller.flash.message != null
        assert Gen_content.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_content/list'


        populateValidParams(params)
        def gen_content = new Gen_content(params)

        assert gen_content.save() != null

        params.id = gen_content.id

        def model = controller.show()

        assert model.gen_contentInstance == gen_content
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_content/list'


        populateValidParams(params)
        def gen_content = new Gen_content(params)

        assert gen_content.save() != null

        params.id = gen_content.id

        def model = controller.edit()

        assert model.gen_contentInstance == gen_content
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_content/list'

        response.reset()


        populateValidParams(params)
        def gen_content = new Gen_content(params)

        assert gen_content.save() != null

        // test invalid parameters in update
        params.id = gen_content.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gen_content/edit"
        assert model.gen_contentInstance != null

        gen_content.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gen_content/show/$gen_content.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gen_content.clearErrors()

        populateValidParams(params)
        params.id = gen_content.id
        params.version = -1
        controller.update()

        assert view == "/gen_content/edit"
        assert model.gen_contentInstance != null
        assert model.gen_contentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gen_content/list'

        response.reset()

        populateValidParams(params)
        def gen_content = new Gen_content(params)

        assert gen_content.save() != null
        assert Gen_content.count() == 1

        params.id = gen_content.id

        controller.delete()

        assert Gen_content.count() == 0
        assert Gen_content.get(gen_content.id) == null
        assert response.redirectedUrl == '/gen_content/list'
    }
}
