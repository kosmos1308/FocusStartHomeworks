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
    func sendDetailImage()
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
    private func setHandlers() {
        self.view?.onTouchedHandler = { [weak self] in
            let vc = ModalViewController()
            let text = self?.model.getDescription()
            vc.modalViewModel.data.data = text ?? ""
            self?.controller?.presentVC(vc: vc)
        }
    }
}

//MARK: - IDetailPresenter
extension DetailPresenter: IDetailPresenter {
    func loadView(controller: DetailViewController, view: IDetailView) {
        self.controller = controller
        self.view = view
        
        setHandlers()
    }
    
    func sendDetailImage() {
        guard let view = view else {return}
        
        let title = model.getTitle()
        let nameImage = model.getNameImage()
        let description = model.getDescription()
        
        view.updateView(title: title, nameImage: nameImage, description: description)
    }
}
