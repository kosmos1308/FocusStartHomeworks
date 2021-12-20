//
//  DownloadImagePresenter.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import Foundation

protocol IDownloadImagePresenter: AnyObject {
    func loadView(controller: DownloadImageViewController, view: IDownloadImageView)
}

final class DownloadImagePresenter {
    
    private let model: IDownloadImageModel
    private weak var view: IDownloadImageView?
    private weak var controller: IDownloadImageViewController?
    
    struct Dependicies {
        let model: IDownloadImageModel
    }
    
    init(dependicies: Dependicies) {
        self.model = dependicies.model
    }
    

}

extension DownloadImagePresenter: IDownloadImagePresenter {
    func loadView(controller: DownloadImageViewController, view: IDownloadImageView) {
        self.controller = controller
        self.view = view

    }
}
