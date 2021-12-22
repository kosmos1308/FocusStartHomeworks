//
//  CompanyAssembly.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//

import Foundation
import UIKit

final class CompanyAssembly {
    static func build() -> UIViewController {
        
        //model
        let router = CompanyRouter()
        let presenter = CompanyPresenter(dependencies: .init(router: router))
        let controller = CompanyViewController(dependencies: .init(presenter: presenter))
        router.setRootController(controller: controller)
        
        return controller
    }
}
