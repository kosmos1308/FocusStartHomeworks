//
//  TypeCar.swift
//  chooseCar
//
//  Created by pavel on 11.12.21.
//

import Foundation

struct TypeCar {
    let price: PriceCar
    let body: Body
    let image: [ImageCar]
    let modelCar: ModelCar
}

struct ImageCar {
    //let nameCar: String
    let nameImage: String
}

struct PriceCar {
    let price: Int
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
