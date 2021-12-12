//
//  DetailAssembly.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation
import UIKit

final class DetailsAssembly {
    static func build() -> UIViewController {
        let model = TypeCarModel()
        let router = Router()
        let presenter = DetailsPresenter(detailsDependencies: .init(model: model, router: router))
        let controller = DetailsViewController(detailsDependencies: .init(presenter: presenter))
        
        return controller
    }
}
