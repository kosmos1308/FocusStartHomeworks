//
//  DetailModel.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import Foundation

class DetailModel {

    private var title: String = ""
    private var nameImage: String = ""
    private var description: String = ""
    
    func getTitle() -> String {
        return self.title
    }
    
    func getNameImage() -> String {
        return self.nameImage
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setNameImage(nameImage: String) {
        self.nameImage = nameImage
    }
    
    func setDescription(description: String) {
        self.description = description
    }
}
