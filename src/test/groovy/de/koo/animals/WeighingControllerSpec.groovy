package de.koo.animals

import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.*

class WeighingControllerSpec extends Specification implements ControllerUnitTest<WeighingController>, DomainUnitTest<Weighing> {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * list(_) >> []
            1 * count() >> 0
        }

        when:"The index action is executed"
        controller.index()

        then:"The model is correct"
        !model.weighingList
        model.weighingCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
        controller.create()

        then:"The model is correctly created"
        model.weighing!= null
    }

    void "Test the save action with a null instance"() {
        when:"Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        controller.save(null)

        then:"A 404 error is returned"
        response.redirectedUrl == '/weighing/index'
        flash.message != null
    }

    void "Test the save action correctly persists"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * save(_ as Weighing)
        }

        when:"The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        populateValidParams(params)
        def weighing = new Weighing(params)
        weighing.id = 1

        controller.save(weighing)

        then:"A redirect is issued to the show action"
        response.redirectedUrl == '/weighing/show/1'
        controller.flash.message != null
    }

    void "Test the save action with an invalid instance"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * save(_ as Weighing) >> { Weighing weighing ->
                throw new ValidationException("Invalid instance", weighing.errors)
            }
        }

        when:"The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def weighing = new Weighing()
        controller.save(weighing)

        then:"The create view is rendered again with the correct model"
        model.weighing != null
        view == 'create'
    }

    void "Test the show action with a null id"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * get(null) >> null
        }

        when:"The show action is executed with a null domain"
        controller.show(null)

        then:"A 404 error is returned"
        response.status == 404
    }

    void "Test the show action with a valid id"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * get(2) >> new Weighing()
        }

        when:"A domain instance is passed to the show action"
        controller.show(2)

        then:"A model is populated containing the domain instance"
        model.weighing instanceof Weighing
    }

    void "Test the edit action with a null id"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * get(null) >> null
        }

        when:"The show action is executed with a null domain"
        controller.edit(null)

        then:"A 404 error is returned"
        response.status == 404
    }

    void "Test the edit action with a valid id"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * get(2) >> new Weighing()
        }

        when:"A domain instance is passed to the show action"
        controller.edit(2)

        then:"A model is populated containing the domain instance"
        model.weighing instanceof Weighing
    }


    void "Test the update action with a null instance"() {
        when:"Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then:"A 404 error is returned"
        response.redirectedUrl == '/weighing/index'
        flash.message != null
    }

    void "Test the update action correctly persists"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * save(_ as Weighing)
        }

        when:"The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        populateValidParams(params)
        def weighing = new Weighing(params)
        weighing.id = 1

        controller.update(weighing)

        then:"A redirect is issued to the show action"
        response.redirectedUrl == '/weighing/show/1'
        controller.flash.message != null
    }

    void "Test the update action with an invalid instance"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * save(_ as Weighing) >> { Weighing weighing ->
                throw new ValidationException("Invalid instance", weighing.errors)
            }
        }

        when:"The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(new Weighing())

        then:"The edit view is rendered again with the correct model"
        model.weighing != null
        view == 'edit'
    }

    void "Test the delete action with a null instance"() {
        when:"The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then:"A 404 is returned"
        response.redirectedUrl == '/weighing/index'
        flash.message != null
    }

    void "Test the delete action with an instance"() {
        given:
        controller.weighingService = Mock(WeighingService) {
            1 * delete(2)
        }

        when:"The domain instance is passed to the delete action"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(2)

        then:"The user is redirected to index"
        response.redirectedUrl == '/weighing/index'
        flash.message != null
    }
}






