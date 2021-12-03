//
//  DetailModel.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import Foundation

//MARK: - protocol definition
protocol IDetailModel {
    func getTitle() -> String
    func getNameImage() -> String
    func getDescription() -> String
}

//MARK: - class definiton
final class DetailModel {
    private var title: String
    private var nameImage: String
    private var description: String
    
    init(photo: Photo) {
        self.title = photo.titlePhoto
        self.nameImage = photo.namePhoto
        self.description = photo.descriptionPhoto
    }
}


//MARK: - IDetailModel
extension DetailModel: IDetailModel {
    func getTitle() -> String {
        return self.title
    }
    
    func getNameImage() -> String {
        return self.nameImage
    }
    
    func getDescription() -> String {
        return self.description
    }
}
