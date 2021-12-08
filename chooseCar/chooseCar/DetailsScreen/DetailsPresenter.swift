//
//  DetailsPresenter.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import Foundation

class DetailsPresenter {
    
    //model
    private var detailsView: DetailsView?
    private var detailsController: DetailsViewController?
    
    init() {
        
    }
    
    func loadView(controller: DetailsViewController, view: DetailsView) {
        self.detailsController = controller
        self.detailsView = view
        self.loadView(controller: controller, view: view)
    }
    
}
