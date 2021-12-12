//
//  Router.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation
import UIKit

final class Router {
    
    private var chooseController: UIViewController?
    private var detailsController: UIViewController?
    
    func setRootController(controller: UIViewController) {
        self.chooseController = controller
    }
    
    func setDetailsController(controller: UIViewController) {
        self.detailsController = controller
    }
    
    func next(car: String) {
        guard let detailsController = detailsController else {
            return
        }
        self.chooseController?.navigationController?.pushViewController(detailsController, animated: true)
    }
    
    func back() {
        self.detailsController?.navigationController?.popToRootViewController(animated: true)
    }
}
