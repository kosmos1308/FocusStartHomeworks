//
//  CompanyPresenter.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//

import Foundation

protocol ICompanyPresenter {
    func loadView(controller: CompanyViewController, view: ICompanyView)
}


final class CompanyPresenter {
    
    private let router: ICompanyRouter
    private weak var view: ICompanyView?
    private weak var controller: CompanyViewController?
    
    struct Dependencies {
        //let model: ICompanyModel
        let router: ICompanyRouter
    }
    
    init(dependencies: Dependencies) {
        self.router = dependencies.router
    }
    


}

private extension CompanyPresenter {
    private func setHandlers() {
        //click "+"
        self.controller?.onTouchAddHandler = { [weak self] in
            self?.controller?.showAlert()
        }
        
        //click "Add (alert)"
        self.controller?.nameCompanyHandler = { [weak self] company in
            print(company)
            //add array tableView
        }
        
        //click cell
        self.view?.onTouchHandler = { [weak self] index in
            self?.router.next(index: index)
            let employeeVC = EmployeeViewController()
            employeeVC.text = "\(index)"
        }
    }
}

extension CompanyPresenter: ICompanyPresenter {
    func loadView(controller: CompanyViewController, view: ICompanyView) {
        self.controller = controller
        self.view = view
        self.setHandlers()
    }
}
