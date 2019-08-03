package de.koo.animals

import grails.gorm.services.Service

@Service(Animal)
interface AnimalService {

    Animal get(Serializable id)

    List<Animal> list(Map args)

    Long count()

    void delete(Serializable id)

    Animal save(Animal animal)

}