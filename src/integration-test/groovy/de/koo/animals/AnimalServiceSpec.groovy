package de.koo.animals

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class AnimalServiceSpec extends Specification {

    AnimalService animalService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Animal(...).save(flush: true, failOnError: true)
        //new Animal(...).save(flush: true, failOnError: true)
        //Animal animal = new Animal(...).save(flush: true, failOnError: true)
        //new Animal(...).save(flush: true, failOnError: true)
        //new Animal(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //animal.id
    }

    void "test get"() {
        setupData()

        expect:
        animalService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Animal> animalList = animalService.list(max: 2, offset: 2)

        then:
        animalList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        animalService.count() == 5
    }

    void "test delete"() {
        Long animalId = setupData()

        expect:
        animalService.count() == 5

        when:
        animalService.delete(animalId)
        sessionFactory.currentSession.flush()

        then:
        animalService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Animal animal = new Animal()
        animalService.save(animal)

        then:
        animal.id != null
    }
}
