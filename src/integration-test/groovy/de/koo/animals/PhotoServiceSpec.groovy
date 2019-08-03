package de.koo.animals

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PhotoServiceSpec extends Specification {

    PhotoService photoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Photo(...).save(flush: true, failOnError: true)
        //new Photo(...).save(flush: true, failOnError: true)
        //Photo photo = new Photo(...).save(flush: true, failOnError: true)
        //new Photo(...).save(flush: true, failOnError: true)
        //new Photo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //photo.id
    }

    void "test get"() {
        setupData()

        expect:
        photoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Photo> photoList = photoService.list(max: 2, offset: 2)

        then:
        photoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        photoService.count() == 5
    }

    void "test delete"() {
        Long photoId = setupData()

        expect:
        photoService.count() == 5

        when:
        photoService.delete(photoId)
        sessionFactory.currentSession.flush()

        then:
        photoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Photo photo = new Photo()
        photoService.save(photo)

        then:
        photo.id != null
    }
}
