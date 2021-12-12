//
//  ChoosePresenter.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import Foundation

//MARK: - Protocol definition
protocol IChoosePresenter {
    func loadView(controller: ChooseViewController, view: IChooseView)
}

//MARK: - Class definition
final class ChoosePresenter {
    
    private let router: Router
    private var model: ICarModel
    private let contentModel: IContentModel
   
    private weak var view: IChooseView?
    private weak var controller: IChooseViewController?
        
    struct Dependencies {
        let model: ICarModel
        let contentModel: IContentModel
        let router: Router
    }
    
    init(dependencies: Dependencies) {
        self.model = dependencies.model
        self.contentModel = dependencies.contentModel
        self.router = dependencies.router
    }
}

//MARK: - Private extension
private extension ChoosePresenter {
    func setHandlers() {
        self.view?.onTouchedHandler = { [weak self] car in
            //print(car)
            self?.router.next(car: car)
        }
    }
    
    func presentContent() {
        let content = self.contentModel.getContent() 
        let presentContent = PresentContent(navigationBarText: content.navigationBarText, labelText: content.labelText)
        self.view?.setContentLabel(text: presentContent)
    }
    
    func presentCars() {
        let cars = self.model.getCars()
        self.controller?.setCars(modelsCars: cars)
    }
}

//MARK: - IChoosePresenter
extension ChoosePresenter: IChoosePresenter {
    func loadView(controller: ChooseViewController, view: IChooseView) {
        self.controller = controller
        self.view = view
        presentContent()
        presentCars()
        setHandlers()
    }
}
