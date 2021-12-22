//
//  CompanyRouter.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//

import Foundation

protocol ICompanyRouter {
    var companyController: ICompanyViewController? { get set }
    func next(index: IndexPath)
}

class CompanyRouter: ICompanyRouter {
    var companyController: ICompanyViewController?
    
    func setRootController(controller: ICompanyViewController) {
        self.companyController = controller
    }
    
    func next(index: IndexPath) {
        let employeeVC = EmployeeViewController()
        self.companyController?.navigationController?.pushViewController(employeeVC, animated: true)
    }
}
