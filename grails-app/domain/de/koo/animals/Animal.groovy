package de.koo.animals

import java.util.Date;

class Animal {
	String name
	String gender
	String species
	Integer cageNr
	Date arrived
	Date lastUpdated
	Date dateCreated
	String lastUpdatedBy
	String createdBy
	String approbation
	String characteristics
	String comment
	Date diedOn
	Date birthDate
	String supplier
	
	static hasMany = [weighings:Weighing,photos:Photo]
	static mapping = {
		weighings sort:'weighted'
	}
	static constraints = {
        name(size:2..10,blank:false,unique:true)
        cageNr(nullable:false,min:1)
        arrived(nullable:false)
        approbation(blank:false)
        gender(blank:false,inList:["m", "f", "u"])
        characteristics(nullable:true)
        comment(nullable:true)
        diedOn(nullable:true)
        birthDate(nullable:true)
        supplier(nullable:true)
    }
	
	String toString() {"${this.name}"}
}
