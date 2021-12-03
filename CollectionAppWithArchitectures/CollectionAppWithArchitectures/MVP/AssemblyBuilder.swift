//
//  AssemblyBuilder.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 1.12.21.
//

import UIKit

final class AssamblyDetailVC {
    static func build(photo: Photo) -> UIViewController {
        let detailPhoto = DetailModel(photo: photo)
        let presenter = DetailPresenter(photo: detailPhoto)
        let controller = DetailViewController(presenter: presenter)
        
        return controller
    }
}
