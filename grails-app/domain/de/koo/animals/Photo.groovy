package de.koo.animals

class Photo {
	String name
	Date created
	String createdBy
	Animal animal
	static belongsTo = Animal

	static constraints = {
        name(size:2..20,blank:false,unique:true)
        created(nullable:true)
	}
	
	String toString() {"${this.name}"}
}
