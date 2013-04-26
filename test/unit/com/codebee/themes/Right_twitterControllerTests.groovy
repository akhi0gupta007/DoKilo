package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Right_twitterController)
@Mock(Right_twitter)
class Right_twitterControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/right_twitter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.right_twitterInstanceList.size() == 0
        assert model.right_twitterInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.right_twitterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.right_twitterInstance != null
        assert view == '/right_twitter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/right_twitter/show/1'
        assert controller.flash.message != null
        assert Right_twitter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/right_twitter/list'


        populateValidParams(params)
        def right_twitter = new Right_twitter(params)

        assert right_twitter.save() != null

        params.id = right_twitter.id

        def model = controller.show()

        assert model.right_twitterInstance == right_twitter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/right_twitter/list'


        populateValidParams(params)
        def right_twitter = new Right_twitter(params)

        assert right_twitter.save() != null

        params.id = right_twitter.id

        def model = controller.edit()

        assert model.right_twitterInstance == right_twitter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/right_twitter/list'

        response.reset()


        populateValidParams(params)
        def right_twitter = new Right_twitter(params)

        assert right_twitter.save() != null

        // test invalid parameters in update
        params.id = right_twitter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/right_twitter/edit"
        assert model.right_twitterInstance != null

        right_twitter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/right_twitter/show/$right_twitter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        right_twitter.clearErrors()

        populateValidParams(params)
        params.id = right_twitter.id
        params.version = -1
        controller.update()

        assert view == "/right_twitter/edit"
        assert model.right_twitterInstance != null
        assert model.right_twitterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/right_twitter/list'

        response.reset()

        populateValidParams(params)
        def right_twitter = new Right_twitter(params)

        assert right_twitter.save() != null
        assert Right_twitter.count() == 1

        params.id = right_twitter.id

        controller.delete()

        assert Right_twitter.count() == 0
        assert Right_twitter.get(right_twitter.id) == null
        assert response.redirectedUrl == '/right_twitter/list'
    }
}
