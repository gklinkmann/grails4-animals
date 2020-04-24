package de.koo.animals

import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.*

class PhotoControllerSpec extends Specification implements ControllerUnitTest<PhotoController>, DomainUnitTest<Photo> {

    void "Test the delete action with a null instance"() {
        when:"The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then:"A 404 is returned"
        response.redirectedUrl == '/photo/index'
        flash.message != null
    }

    void "Test the delete action with an instance"() {
        given:
        controller.photoService = Mock(PhotoService) {
            1 * delete(2)
        }

        when:"The domain instance is passed to the delete action"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(2)

        then:"The user is redirected to index"
        response.redirectedUrl == '/photo/index'
        flash.message != null
    }
}






