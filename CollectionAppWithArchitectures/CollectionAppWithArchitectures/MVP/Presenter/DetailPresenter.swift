//
//  Presenter.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import Foundation
import UIKit

//MARK: - protocol definition
protocol IDetailPresenter {
    func loadView(controller: DetailViewController, view: IDetailView)
}

//MARK: - class definition
final class DetailPresenter {
    var model: IDetailModel
    private weak var controller: DetailViewController?
    private weak var view: IDetailView?
    
    init(photo: IDetailModel) {
        self.model = photo
    }
}

//MARK: - private extension
private extension DetailPresenter {
    func setHandlers() {
        self.view?.onTouchedHandler = { [weak self] in
            let vc = ModalViewController()
            let text = self?.model.getData().descriptionPhoto
            vc.modalViewModel.data.data = text ?? ""
            self?.controller?.presentVC(vc: vc)
        }
    }
    
    func sendDetailImage() {
        guard let view = view else {return}
        let data = model.getData()
        view.updateView(title: data.titlePhoto, nameImage: data.namePhoto, description: data.descriptionPhoto)
    }
}

//MARK: - IDetailPresenter
extension DetailPresenter: IDetailPresenter {
    func loadView(controller: DetailViewController, view: IDetailView) {
        self.controller = controller
        self.view = view
        setHandlers()
        sendDetailImage()
    }
}
