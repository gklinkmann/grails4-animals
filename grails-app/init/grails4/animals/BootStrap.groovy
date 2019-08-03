package grails4.animals

import de.koo.animals.Animal
import de.koo.animals.AnimalService
import de.koo.animals.Photo
import de.koo.animals.PhotoService
import de.koo.animals.Role
import de.koo.animals.User
import de.koo.animals.UserRole
import de.koo.animals.Weighing
import de.koo.animals.WeighingService
import grails.util.Environment

class BootStrap {
	AnimalService animalService
	WeighingService weighingService
	PhotoService photoService
	
    def init = { servletContext ->
		if (Environment.current == Environment.DEVELOPMENT) {
			if (User.count()==0) {
				def adminRole = Role.findByAuthority("ROLE_ADMIN")?:new Role(authority: 'ROLE_ADMIN').save()
				def userRole = Role.findByAuthority("ROLE_USER")?:new Role(authority: 'ROLE_USER').save()
		
				def user = new User(username: 'user', password: 'user', firstname:"Gero", lastname:"Klinkmann", email:"user@gmail.com")
				user.save()
				
				def admin = new User(username: 'admin', password: 'admin', firstname:"Ad", lastname:"Min", email:"admin@gmail.com")
				admin.save()
		
				UserRole.create(user, userRole)
				UserRole.create(admin, userRole)
				UserRole.create(admin, adminRole)
			}
	
			if (animalService.count()==0) {
				
				// animals
				(1..20).each{
					Animal animal=new Animal(name: 'A'+it, cageNr: it.toInteger(),arrived:new java.sql.Date(new Date().time), approbation:'app1'
					,gender:'f',species:'c', createdBy:"juhu", lastUpdatedBy:"juhu")
				animalService.save(animal)
				}
				
				// weighings
				Animal animal=animalService.get(1)
				(1..10).each{
					Weighing weighing=new Weighing(weighted: new java.sql.Date(new Date().time)
					,createdBy:"juhu", lastUpdatedBy:"juhu",weight:100+it.toInteger()*2,animal:animal)
					weighingService.save(weighing)
				}
				
				// photos
				["a","b"].each{
					Photo photo=new Photo(created: new java.sql.Date(new Date().time)
					,createdBy:"juhu", name:"A4_${it}.JPG",animal:animal)
					photoService.save(photo)
				}
	
			}
		}
    }
	
    def destroy = {
    }
}
