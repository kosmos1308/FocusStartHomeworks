//
//  DetailsCar.swift
//  chooseCar
//
//  Created by pavel on 12.12.21.
//

import Foundation

struct DetailsCar {
    let price: [String]
    let nameImage: [String]
    let modelCar: ModelCar
    let bodyCar: [Body]
}

class DetailsCarModel {
    var cars = [DetailsCar]()
    
    init() {
        setDetailsCar()
    }
    
    func setDetailsCar() {
        self.cars.append(DetailsCar(price: ["12990", "13000", "10990", "14000"],
                                    nameImage: ["audi-sedan", "audi-hatchback", "audi-universal", "audi-coupe"],
                                    modelCar: .audi,
                                    bodyCar: [.sedan, .hatchback, .universal, .coupe]))
        self.cars.append(DetailsCar(price: ["14990", "13900", "14990", "14500"],
                                    nameImage: ["bmw-sedan", "bmw-hatchback", "bmw-universal", "bmw-coupe"],
                                    modelCar: .bmw,
                                    bodyCar: [.sedan, .hatchback, .universal, .coupe]))
//        self.cars.append(DetailsCar(price: ["12990", "13000", "10990", "14000"],
//                                    nameImage: ["", "", "", ""],
//                                    modelCar: .mazda,
//                                    bodyCar: [.sedan, .hatchback, .universal, .coupe]))
//        self.cars.append(DetailsCar(price: ["12990", "13000", "10990", "14000"],
//                                    nameImage: ["", "", "", ""],
//                                    modelCar: .lexus,
//                                    bodyCar: [.sedan, .hatchback, .universal, .coupe]))
//        self.cars.append(DetailsCar(price: ["12990", "13000", "10990", "14000"],
//                                    nameImage: ["", "", "", ""],
//                                    modelCar: .mersedes,
//                                    bodyCar: [.sedan, .hatchback, .universal, .coupe]))
    }
    
    func getDetailsCar() -> [DetailsCar] {
        return self.cars
    }
    
}
