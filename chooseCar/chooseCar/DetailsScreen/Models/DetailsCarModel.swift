//
//  DetailsCarModel.swift
//  chooseCar
//
//  Created by pavel on 11.12.21.
//

import Foundation

//MARK: - Protocol definition
protocol IDetailsCarModel {
    func getTypeBodyCars() -> [Body]
    func getImagesCar(indexCar: Int) -> [String]
    func getPriceCar(indexCar: Int) -> [String]
    func getCar(index: Int) -> DetailsCar
}

//MARK: - Class definition
final class DetailsCarModel {
    
    private var bodyArray: [Body] = []
    private var carsArray: [DetailsCar] = []
    
    init() {
        setTypeBody()
        setImagesCar()
    }
    
    private func setTypeBody() {
        self.bodyArray.append(.sedan)
        self.bodyArray.append(.hatchback)
        self.bodyArray.append(.universal)
        self.bodyArray.append(.coupe)
    }
    
    private func setImagesCar() {
        self.carsArray.append(DetailsCar(price: ["15990", "17000", "19990", "18900"],
                                      image: ["audi-sedan", "audi-hatchback", "audi-universal", "audi-coupe"],
                                      modelCar: .audi,
                                      body: [.sedan, .hatchback, .universal, .coupe]))
        
        self.carsArray.append(DetailsCar(price: ["15990", "14000", "15990", "14300"],
                                      image: ["bmw-sedan", "bmw-hatchback", "bmw-universal", "bmw-coupe"],
                                      modelCar: .bmw,
                                      body: [.sedan, .hatchback, .universal, .coupe]))
        self.carsArray.append(DetailsCar(price: ["13990", "13500", "15990", "19000"],
                                      image: ["mazda-sedan", "mazda-hatchback", "mazda-universal", "mazda-coupe"],
                                      modelCar: .mazda,
                                      body: [.sedan, .hatchback, .universal, .coupe]))
        self.carsArray.append(DetailsCar(price: ["24990", "18800", "20990", "18400"],
                                      image: ["lexus-sedan", "lexus-hatchback", "lexus-universal", "lexus-coupe"],
                                      modelCar: .lexus,
                                      body: [.sedan, .hatchback, .universal, .coupe]))
        self.carsArray.append(DetailsCar(price: ["12990", "13000", "13990", "14000"],
                                      image: ["mersedes-sedan", "mersedes-hatchback", "mersedes-universal", "mersedes-coupe"],
                                      modelCar: .mersedes,
                                      body: [.sedan, .hatchback, .universal, .coupe]))
    }
}

//MARK: - ITypeCarModel
extension DetailsCarModel: IDetailsCarModel {
    
    func getTypeBodyCars() -> [Body] {
        return self.bodyArray
    }
    
    func getImagesCar(indexCar: Int) -> [String] {
        let images = self.carsArray[indexCar].image
        return images
    }
    
    func getPriceCar(indexCar: Int) -> [String] {
        return self.carsArray[indexCar].price
    }

    func getCar(index: Int) -> DetailsCar {
        return self.carsArray[index]
    }
}
