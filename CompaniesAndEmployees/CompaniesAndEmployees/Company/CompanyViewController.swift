//
//  CompanyViewController.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//

import UIKit

protocol ICompanyViewController: UIViewController {
    var onTouchAddHandler: (() -> Void)? { get set }
    var nameCompanyHandler: ((String) -> Void)? { get set }
    func showAlert()
}

final class CompanyViewController: UIViewController {
    
    var onTouchAddHandler: (() -> Void)?
    var nameCompanyHandler: ((String) -> Void)?
    
    private var companyView: ICompanyView
    private var companyPresenter: ICompanyPresenter
    
    struct Dependencies {
        let presenter: ICompanyPresenter
    }
    
    init(dependencies: Dependencies) {
        self.companyView = CompanyView(frame: UIScreen.main.bounds)
        self.companyPresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.companyPresenter.loadView(controller: self, view: self.companyView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.updateNavBar()
    }
    
    private func updateNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Companies"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(addButtonTapped))
    }
    
    @objc
    private func addButtonTapped() {
        self.onTouchAddHandler?()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.companyView)
    }

}

extension CompanyViewController: ICompanyViewController {
    func showAlert() {
        let alert = UIAlertController(title: "ADD COMPANY",
                                      message: nil,
                                      preferredStyle: .alert)
        alert.addTextField { nameCompany in
            nameCompany.placeholder = "Name company"
        }
        let ok = UIAlertAction(title: "Add", style: .default) { action in
            guard let text = alert.textFields?.first?.text else { return }
            self.nameCompanyHandler?(text)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
