//
//  Router.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation
import UIKit

//MARK: - Protocol definition
protocol IChooseRouter {
    var chooseController: IChooseViewController? { get set }
    func next(index: Int)
}


//MARK: - Class definition
final class ChooseRouter: IChooseRouter {
    
    var chooseController: IChooseViewController?
    
    func setRootController(controller: IChooseViewController) {
        self.chooseController = controller
    }
    
    func next(index: Int) {
        let detailController = DetailsAssembly.build()
        detailController.setIndexCar(index: index)
        self.chooseController?.navigationController?.pushViewController(detailController, animated: false)
    }
}
