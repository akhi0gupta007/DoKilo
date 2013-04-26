package com.codebee.marketing



import org.junit.*
import grails.test.mixin.*

@TestFor(NewsLettersController)
@Mock(NewsLetters)
class NewsLettersControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newsLetters/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newsLettersInstanceList.size() == 0
        assert model.newsLettersInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.newsLettersInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newsLettersInstance != null
        assert view == '/newsLetters/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newsLetters/show/1'
        assert controller.flash.message != null
        assert NewsLetters.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetters/list'


        populateValidParams(params)
        def newsLetters = new NewsLetters(params)

        assert newsLetters.save() != null

        params.id = newsLetters.id

        def model = controller.show()

        assert model.newsLettersInstance == newsLetters
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetters/list'


        populateValidParams(params)
        def newsLetters = new NewsLetters(params)

        assert newsLetters.save() != null

        params.id = newsLetters.id

        def model = controller.edit()

        assert model.newsLettersInstance == newsLetters
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetters/list'

        response.reset()


        populateValidParams(params)
        def newsLetters = new NewsLetters(params)

        assert newsLetters.save() != null

        // test invalid parameters in update
        params.id = newsLetters.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newsLetters/edit"
        assert model.newsLettersInstance != null

        newsLetters.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newsLetters/show/$newsLetters.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newsLetters.clearErrors()

        populateValidParams(params)
        params.id = newsLetters.id
        params.version = -1
        controller.update()

        assert view == "/newsLetters/edit"
        assert model.newsLettersInstance != null
        assert model.newsLettersInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newsLetters/list'

        response.reset()

        populateValidParams(params)
        def newsLetters = new NewsLetters(params)

        assert newsLetters.save() != null
        assert NewsLetters.count() == 1

        params.id = newsLetters.id

        controller.delete()

        assert NewsLetters.count() == 0
        assert NewsLetters.get(newsLetters.id) == null
        assert response.redirectedUrl == '/newsLetters/list'
    }
}
