//
//  DetailsPresenter.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import Foundation
import UIKit

protocol IDetailsPresenter {
    func loadView(controller: IDetailsViewController, view: IDetailsView)
}

final class DetailsPresenter {
    
    private weak var router: Router?
    private let model: ITypeCarModel
    private weak var detailsView: IDetailsView?
    private weak var detailsController: IDetailsViewController?
    
    struct DetailsDependencies {
        let model: ITypeCarModel
        let router: Router
    }
    
    init(detailsDependencies: DetailsDependencies) {
        self.model = detailsDependencies.model
        self.router = detailsDependencies.router
    }
    
    
    //body
    func presentBodyCar() {
        let body = self.model.getTypeCar()
        self.detailsView?.setTypeBodyCars(typeBodyCars: body)
    }
    
    //default
    func setDefaultPriceAndCar() {
        guard let nameImage = self.model.getImagesCar().first?.nameImage else { return }
        let price = "\(self.model.getPriceCar()) $"
        print(price)
        self.detailsView?.showDefaultPriceAndBody(price: price, body: "Седан", image: nameImage)
    }
    
    func setHandlers() {
        
        //images? + circle background?
        self.detailsController?.onTouchedHandler = { [weak self] index in
            //print("index - \(index)")
            //print(car[index].nameImage)
            guard let car = self?.model.getImagesCar() else { return }
            self?.detailsView?.changeImage(car[index].nameImage)
            self?.detailsView?.changeCircleColor(true, index: index)
            self?.detailsView?.typeBodyTableView.reloadData()
        }
        
        //price
        self.detailsView?.onTouchedHandler = { [weak self] index in
            print("index: ", index)
            guard let price = self?.model.getPriceCar() else { return }
            let presentPrice = "\(price)" + " $"
            self?.detailsView?.showPriceCar(presentPrice)
        }
    }

}

extension DetailsPresenter: IDetailsPresenter {
    func loadView(controller: IDetailsViewController, view: IDetailsView) {
        self.detailsController = controller
        self.detailsView = view
        
        setDefaultPriceAndCar()
        presentBodyCar()
        setHandlers()
    }
}
