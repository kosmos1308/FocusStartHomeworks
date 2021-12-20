//
//  DownloadImageAssembly.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import Foundation
import UIKit

final class DownloadImageAssembly {
    
    static func build() -> UIViewController {
        let model = DownloadImageModel()
        let networkService = NetworkService()
        let presenter = DownloadImagePresenter(dependicies: .init(model: model, networkService: networkService))
        let controller = DownloadImageViewController(dependencies: .init(presenter: presenter))
        
        return controller
    }
}
