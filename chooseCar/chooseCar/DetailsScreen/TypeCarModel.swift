//
//  TypeCarModel.swift
//  chooseCar
//
//  Created by pavel on 11.12.21.
//

import Foundation

protocol ITypeCarModel {
    func getTypeCar() -> [Body]
    func getImagesCar() -> [ImageCar]
    func getPriceCar() -> Int
    func setCarModel(modelCar: Car)
}

class TypeCarModel {
    
    private var bodyArray: [Body] = []
    private var imagesCarArray: [ImageCar] = []
    private var index: Int = 0
    private var price: Int = 0
    
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
        self.imagesCarArray.append(ImageCar(nameImage: "audi-sedan"))
        self.imagesCarArray.append(ImageCar(nameImage: "audi-hatchback"))
        self.imagesCarArray.append(ImageCar(nameImage: "audi-universal"))
        self.imagesCarArray.append(ImageCar(nameImage: "audi-coupe"))
        
        //self.imagesCarArray.append(<#T##newElement: ImageCar##ImageCar#>)
    }
}

extension TypeCarModel: ITypeCarModel {
    func getTypeCar() -> [Body] {
        return self.bodyArray
    }
    
    func getImagesCar() -> [ImageCar] {
        return self.imagesCarArray
    }
    
    func setCarModel(modelCar: Car) {
        
    }
    
    func getPriceCar() -> Int {
        self.price = Int.random(in: 10000...15000)
        return self.price
    }
}
