package de.koo.animals

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class WeighingServiceSpec extends Specification {

    WeighingService weighingService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Weighing(...).save(flush: true, failOnError: true)
        //new Weighing(...).save(flush: true, failOnError: true)
        //Weighing weighing = new Weighing(...).save(flush: true, failOnError: true)
        //new Weighing(...).save(flush: true, failOnError: true)
        //new Weighing(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //weighing.id
    }

    void "test get"() {
        setupData()

        expect:
        weighingService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Weighing> weighingList = weighingService.list(max: 2, offset: 2)

        then:
        weighingList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        weighingService.count() == 5
    }

    void "test delete"() {
        Long weighingId = setupData()

        expect:
        weighingService.count() == 5

        when:
        weighingService.delete(weighingId)
        sessionFactory.currentSession.flush()

        then:
        weighingService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Weighing weighing = new Weighing()
        weighingService.save(weighing)

        then:
        weighing.id != null
    }
}
