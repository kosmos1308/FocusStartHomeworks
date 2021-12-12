//
//  CarModel.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation

protocol ICarModel {
    func getCars() -> [Car]
}

final class CarModel {
    static let shared = CarModel()
    private var cars = [Car]()
    
    init() {
        setCars()
    }

    private func setCars() {
        cars.append(Car(modelCar: "Audi"))
        cars.append(Car(modelCar: "BMW"))
        cars.append(Car(modelCar: "Mazda"))
        cars.append(Car(modelCar: "Lexus"))
        cars.append(Car(modelCar: "Mersedes"))
    }
}

extension CarModel: ICarModel {
    func getCars() -> [Car] {
        return self.cars
    }
}
