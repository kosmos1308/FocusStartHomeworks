//
//  ChooseAssembly.swift
//  chooseCar
//
//  Created by pavel on 9.12.21.
//

import Foundation
import UIKit

final class ChooseAssembly {
    static func build() -> IChooseViewController {
        let model = CarModel()
        let contentModel = ContentModel()
        let router = ChooseRouter()
        let presenter = ChoosePresenter(dependencies: .init(model: model, contentModel: contentModel, router: router))
        let controller = ChooseViewController(dependencies: .init(presenter: presenter))
        router.setRootController(controller: controller)

        return controller
    }
}
