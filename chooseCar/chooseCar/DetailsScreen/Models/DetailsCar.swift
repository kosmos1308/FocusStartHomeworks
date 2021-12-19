//
//  TypeCar.swift
//  chooseCar
//
//  Created by pavel on 11.12.21.
//

import Foundation

struct DetailsCar {
    let price: [String] 
    let image: [String]
    let modelCar: ModelCar
    let body: [Body]
}

enum Body: String, CaseIterable {
    case sedan = "Седан"
    case hatchback = "Хэтчбек"
    case universal = "Универсал"
    case coupe = "Купе"
}

enum ModelCar: String, CaseIterable {
    case audi = "Audi"
    case bmw = "BMW"
    case mazda = "Mazda"
    case lexus = "Lexus"
    case mersedes = "Mersedes"
}
