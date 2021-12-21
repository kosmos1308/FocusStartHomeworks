//
//  DownloadImagePresenter.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

/*
https://kb.rspca.org.au/wp-content/uploads/2018/11/golder-retriever-puppy.jpeg
 */

import Foundation
import UIKit

//MARK: - Protocol definition
protocol IDownloadImagePresenter: AnyObject {
    func loadView(controller: DownloadImageViewController, view: IDownloadImageView)
}

//MARK: - Class definition
final class DownloadImagePresenter {
    
    private let model: IDownloadImageModel
    private var networkService: INetworkService
    private weak var view: IDownloadImageView?
    private weak var controller: IDownloadImageViewController?
    
    struct Dependicies {
        let model: IDownloadImageModel
        let networkService: INetworkService
    }
    
    init(dependicies: Dependicies) {
        self.model = dependicies.model
        self.networkService = dependicies.networkService
    }
    
    func setHandlers() {
        self.view?.onTouchHandler = { [weak self] url in
            self?.networkService.execute(url, completion: { (progress, data, error) in
                self?.controller?.showProgressText(progress: progress.localizedDescription)
                self?.view?.showProgress(progress: Float(progress.fractionCompleted))
            
                if let data = data {
                    DispatchQueue.main.async {
                        self?.model.setImages(url: URL(string: url))
                        guard let name = self?.model.getNameImage() else { return }
                        guard let size = self?.model.getSizeImage() else { return }
                        self?.view?.getData(image: data, name: name, size: size)
                        self?.view?.tableView.reloadData()
                    }
                } else if let error = error {
                    self?.controller?.showAlert(message: error.localizedDescription)
                }
            })
        }
    }
}

//MARK: - IDownloadImagePresenter
extension DownloadImagePresenter: IDownloadImagePresenter {
    func loadView(controller: DownloadImageViewController, view: IDownloadImageView) {
        self.controller = controller
        self.view = view
        self.setHandlers()
    }
}
