//
//  ModalModel.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 30.11.21.
//

import Foundation

//MARK: - class definition
final class ModalModel {
    private var fullDescripton: String?
    
    func getData() -> String {
        return self.fullDescripton ?? ""
    }
    
    func setData(fullDescription: String) {
        self.fullDescripton = fullDescription
    }
}
