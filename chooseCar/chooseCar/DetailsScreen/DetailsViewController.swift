//
//  DetailsViewController.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

protocol IDetailsViewController: AnyObject {
    var onTouchedHandler: ((Int) -> Void)? { get set }
}

final class DetailsViewController: UIViewController {
    
    var onTouchedHandler: ((Int) -> Void)?
    private var typeBodyArray: [Body] = []
   
    private var detailsView: IDetailsView
    private var detailsPresenter: IDetailsPresenter
    
    struct DetailDependencies {
        let presenter: IDetailsPresenter
    }
    
    init(detailsDependencies: DetailDependencies) {
        self.detailsView = DetailsView(frame: UIScreen.main.bounds)
        self.detailsPresenter = detailsDependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.detailsPresenter.loadView(controller: self, view: self.detailsView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(detailsView)
    }
    
    private func updateNavBar() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
    }
}

extension DetailsViewController: IDetailsViewController {
    
}
