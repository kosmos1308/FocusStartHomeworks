//
//  CarModel.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation

//MARK: - Protocol definition
protocol ICarModel {
    func getCars() -> [Car]
}

//MARK: - Class definition
final class CarModel {
    private var cars = [Car]()
    
    init() {
        setCars()
    }

    private func setCars() {
        self.cars.append(Car(modelCar: "Audi"))
        self.cars.append(Car(modelCar: "BMW"))
        self.cars.append(Car(modelCar: "Mazda"))
        self.cars.append(Car(modelCar: "Lexus"))
        self.cars.append(Car(modelCar: "Mersedes"))
    }
}

//MARK: - ICarModel
extension CarModel: ICarModel {
    func getCars() -> [Car] {
        return self.cars
    }
}

