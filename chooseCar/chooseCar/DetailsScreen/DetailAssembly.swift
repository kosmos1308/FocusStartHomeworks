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
        let presenter = DetailsPresenter()
        let controller = DetailsViewController()
        
        return controller
    }
}
