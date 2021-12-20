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

protocol IDownloadImagePresenter: AnyObject {
    func loadView(controller: DownloadImageViewController, view: IDownloadImageView)
}

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
                let progress = progress
                print(progress)
                //print(Float(progress))
                
                if let error = error {
                    //show alert
                    self?.controller?.showAlert(message: error.localizedDescription)
                    
                } else if let data = data {
                    
                    let urlString = URL(string: url)
                    guard let url = urlString else { return }
                    let withoutExt = url.deletingPathExtension()
                    let name = withoutExt.lastPathComponent
                
                    print(data)
                    self?.model.setImages(name: name,
                                          progressDownload: Float(progress) ?? 0.0,
                                          url: urlString,
                                          progressString: progress)
                    let image = self?.model.getImage()
//                    print(image?.first?.url)
//                    print(image?.first?.name)
//                    print(image?.first?.progressString)
//                    print(image?.first?.progressDownload)
//                    print(image)
                }
            })
        }
    }

}

extension DownloadImagePresenter: IDownloadImagePresenter {
    func loadView(controller: DownloadImageViewController, view: IDownloadImageView) {
        self.controller = controller
        self.view = view

        self.setHandlers()
        
    }
}
