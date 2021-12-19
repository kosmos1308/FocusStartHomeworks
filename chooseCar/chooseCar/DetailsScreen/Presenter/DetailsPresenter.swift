//
//  DetailsPresenter.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import Foundation

//MARK: - Protocol definition
protocol IDetailsPresenter {
    func loadView(controller: IDetailsViewController, view: IDetailsView)
    func setCarIndex(index: Int)
}

//MARK: - Class definition
final class DetailsPresenter {
    
    var indexCar: Int = Int()
    var indexCell: Int = Int()
    
    private let router: IDetailsRouter
    private let model: IDetailsCarModel
    private weak var detailsView: IDetailsView?
    private weak var detailsController: IDetailsViewController?
    
    struct DetailsDependencies {
        let model: IDetailsCarModel
        let router: IDetailsRouter
    }
    
    init(detailsDependencies: DetailsDependencies) {
        self.model = detailsDependencies.model
        self.router = detailsDependencies.router
    }
}


//MARK: - Private extension
private extension DetailsPresenter {
    
    func presentBodyCar() {
        let body = self.model.getTypeBodyCars()
        self.detailsView?.setTypeBodyCars(typeBodyCars: body)
    }
    
    func setDefaultPriceAndImageCar() {
        let car = self.model.getCar(index: indexCar)
        let price = car.price[0] + " $"
        let image = car.image[0]
        self.detailsView?.showDefaultPriceAndImage(price: price, image: image)
        self.detailsView?.changeCircleColor(true, index: 0)
    }
    
    private func setHandlers() {
        
        // change circle background + change images car
        self.detailsView?.onTouchedCellHandler = { [weak self] indexCell in
            self?.indexCell = indexCell
            guard let indexCar = self?.indexCar else { return }
            guard let imagesModelsCar = self?.model.getImagesCar(indexCar: indexCar) else { return }
            self?.detailsView?.changeImage(imagesModelsCar[indexCell])
            self?.detailsView?.changeCircleColor(true, index: indexCell)
            self?.detailsView?.typeBodyTableView.reloadData()
        }
        
        // activityIndicatorView + change price car
        self.detailsView?.onTouchedButton = { [weak self] in
            guard let indexCar = self?.indexCar else { return }
            self?.detailsView?.activityIndicatorView.isHidden = false
            self?.detailsView?.activityIndicatorView.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self?.detailsView?.activityIndicatorView.stopAnimating()
                guard let indexCell = self?.indexCell else { return }
                guard let pricesCars = self?.model.getPriceCar(indexCar: indexCar) else { return }
                let presentPriceCar = pricesCars[indexCell] + " $"
                self?.detailsView?.showPriceCar(presentPriceCar)
            }
        }
        
        //back button
        self.detailsController?.onTouchedBackButton = { [weak self] in
            self?.router.back()
        }
    }
}

//MARK: - IDetailsPresenter
extension DetailsPresenter: IDetailsPresenter {
    func setCarIndex(index: Int) {
        self.indexCar = index
    }
    
    func loadView(controller: IDetailsViewController, view: IDetailsView) {
        self.detailsController = controller
        self.detailsView = view
        
        self.setDefaultPriceAndImageCar()
        self.presentBodyCar()
        self.setHandlers()
    }
}
