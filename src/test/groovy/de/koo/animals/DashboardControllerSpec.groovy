package de.koo.animals

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class DashboardControllerSpec extends Specification implements ControllerUnitTest<DashboardController> {
	def 'Test the index action returns the correct model'() {
		given:
			List<User> sampleUsers = [new User(username: 'Nirav', password: 'asdf'),
											new User(username: 'Jeff', password: 'asfd'),
											new User(username: 'Sergio', password: 'asdf'),]
			List<Animal> sampleAnimals = [new Animal(name:'A1'
				,cageNr:1
				,arrived:new Date()
				,approbation:'E1'
				,gender:'m'
			)]
			controller.userService = Stub(UserService) {
				list(_) >> sampleUsers
				count() >> sampleUsers.size()
			}
			
			controller.animalService = Stub(AnimalService) {
				list(_) >> sampleAnimals
				count() >> sampleAnimals.size()
			}

		when: 'The index action is executed'
			controller.index()

		then: 'The model is correct'
			model.animalInstanceTotal
			model.animalInstanceTotal == sampleAnimals.size()
			model.userInstanceTotal
			model.userInstanceTotal == sampleUsers.size()
	}
}
