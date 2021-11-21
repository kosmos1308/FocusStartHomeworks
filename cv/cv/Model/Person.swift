//
//  Person.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import Foundation

final class Person {
    let name: String
    let surname: String
    let photoName: String
    let position: String
    let city: String
    let country: String
    
    init(name: String, surname: String, photoName: String, position: String, city: String, country: String) {
        self.name = name
        self.surname = surname
        self.photoName = photoName
        self.position = position
        self.city = city
        self.country = country
    }
}
