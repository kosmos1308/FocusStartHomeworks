//
//  ChooseAssembly.swift
//  chooseCar
//
//  Created by pavel on 9.12.21.
//

import Foundation
import UIKit

final class ChooseAssembly {
    static func build() -> UIViewController {
        let model = CarModel()
        let contentModel = ContentModel()
        let router = Router()
        let presenter = ChoosePresenter(dependencies: .init(model: model, contentModel: contentModel, router: router))
        let controller = ChooseViewController(dependencies: .init(presenter: presenter))
        let detailsController = DetailsAssembly.build()
        
        router.setRootController(controller: controller)
        router.setDetailsController(controller: detailsController)
        
        return controller
    }
}
