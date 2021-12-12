//
//  ModalViewModel.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 30.11.21.
//

import Foundation

//MARK: - Observed
final class Observed<T> {
    var data: T {
        didSet {
            self.notify?(self.data)
        }
    }
    
    private var notify: ((T) -> Void)?
    
    init(_ data: T) {
        self.data = data
    }
    
    func setNotify(notify: ((T) -> Void)?) {
        self.notify = notify
        self.notify?(self.data)
    }
}

//MARK: - class definition
final class ModalViewModel {
    private let modalModel = ModalModel()
    var data: Observed<String> = Observed<String>("")
    
    init() {
        self.showDescription()
    }
    
    private func showDescription() {
        self.modalModel.setData(fullDescription: "Hello")
        let viewData = self.modalModel.getData()
        self.data.data = viewData
    }
}
