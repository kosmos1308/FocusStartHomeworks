//
//  DetailsRouter.swift
//  chooseCar
//
//  Created by pavel on 19.12.21.
//

import Foundation

//MARK: - Protocol definition
protocol IDetailsRouter {
    var detailsController: IDetailsViewController? { get set }
    func back()
}


//MARK: - Class definition
final class DetailsRouter: IDetailsRouter {
    
    var detailsController: IDetailsViewController?
    
    func setDetailsController(controller: IDetailsViewController) {
        self.detailsController = controller
    }

    func back() {
        self.detailsController?.navigationController?.popToRootViewController(animated: true)
    }
}
