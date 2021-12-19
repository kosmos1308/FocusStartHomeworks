//
//  DetailAssembly.swift
//  chooseCar
//
//  Created by pavel on 10.12.21.
//

import Foundation

final class DetailsAssembly {
    static func build() -> IDetailsViewController {
        let model = DetailsCarModel()
        let router = DetailsRouter()
        let presenter = DetailsPresenter(detailsDependencies: .init(model: model, router: router))
        let controller = DetailsViewController(detailsDependencies: .init(presenter: presenter))
        
        router.setDetailsController(controller: controller)
    
        return controller
    }
}
