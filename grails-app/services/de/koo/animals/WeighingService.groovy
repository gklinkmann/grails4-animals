package de.koo.animals

import grails.gorm.services.Service

@Service(Weighing)
interface WeighingService {

    Weighing get(Serializable id)

    List<Weighing> list(Map args)

    Long count()

    void delete(Serializable id)

    Weighing save(Weighing weighing)

}