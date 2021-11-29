//
//  Presenter.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import Foundation
import UIKit

final class Presenter {
    private let model = DetailModel()
    private weak var controller: DetailViewController?
    private weak var view: DetailView?
    
    
    func loadView(controller: DetailViewController, view: DetailView) {
        self.controller = controller
        self.view = view
        self.view?.configView()
        
        self.setHandlers()
    }
    
    func onTouched() {
        guard let view = view else { return }
        
        let title = model.getTitle()
        let nameImage = model.getNameImage()
        let description = model.getDescription()
        
        view.updateView(title: title, nameImage: nameImage, description: description)
    }
    
    private func setHandlers() {
        self.view?.onTouchedHandler = { [weak self] in
            self?.onTouched()
        }
    }
}
