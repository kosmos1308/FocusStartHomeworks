//
//  Employee+CoreDataProperties.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int64
    @NSManaged public var experience: NSDecimalNumber?
    @NSManaged public var company: Company?

}

extension Employee : Identifiable {

}
