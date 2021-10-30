//
//  Cars.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//

import Foundation

enum Body: String, CaseIterable {
    case saloon = "Седан"
    case estate = "Хэетчбек"
    case coupe = "Купе"
}

struct Cars {
    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int
    var carNumber: String
    
    static var carsArray = [Cars]()
}
