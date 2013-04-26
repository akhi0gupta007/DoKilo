package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(XlsUploaderController)
@Mock(XlsUploader)
class XlsUploaderControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/xlsUploader/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.xlsUploaderInstanceList.size() == 0
        assert model.xlsUploaderInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.xlsUploaderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.xlsUploaderInstance != null
        assert view == '/xlsUploader/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/xlsUploader/show/1'
        assert controller.flash.message != null
        assert XlsUploader.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/xlsUploader/list'


        populateValidParams(params)
        def xlsUploader = new XlsUploader(params)

        assert xlsUploader.save() != null

        params.id = xlsUploader.id

        def model = controller.show()

        assert model.xlsUploaderInstance == xlsUploader
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/xlsUploader/list'


        populateValidParams(params)
        def xlsUploader = new XlsUploader(params)

        assert xlsUploader.save() != null

        params.id = xlsUploader.id

        def model = controller.edit()

        assert model.xlsUploaderInstance == xlsUploader
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/xlsUploader/list'

        response.reset()


        populateValidParams(params)
        def xlsUploader = new XlsUploader(params)

        assert xlsUploader.save() != null

        // test invalid parameters in update
        params.id = xlsUploader.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/xlsUploader/edit"
        assert model.xlsUploaderInstance != null

        xlsUploader.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/xlsUploader/show/$xlsUploader.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        xlsUploader.clearErrors()

        populateValidParams(params)
        params.id = xlsUploader.id
        params.version = -1
        controller.update()

        assert view == "/xlsUploader/edit"
        assert model.xlsUploaderInstance != null
        assert model.xlsUploaderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/xlsUploader/list'

        response.reset()

        populateValidParams(params)
        def xlsUploader = new XlsUploader(params)

        assert xlsUploader.save() != null
        assert XlsUploader.count() == 1

        params.id = xlsUploader.id

        controller.delete()

        assert XlsUploader.count() == 0
        assert XlsUploader.get(xlsUploader.id) == null
        assert response.redirectedUrl == '/xlsUploader/list'
    }
}
