//
//  DetailsViewController.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

//MARK: - Protocol definition
protocol IDetailsViewController: UIViewController {
    func setIndexCar(index: Int)
    var onTouchedBackButton: (() -> Void)? { get set }
}

//MARK: - Class definition
final class DetailsViewController: UIViewController {
    
    var onTouchedBackButton: (() -> Void)?
    
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
        self.updateNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.detailsView)
    }
    
    private func updateNavBar() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
        self.navigationItem.backBarButtonItem?.customView?.isHidden = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(touchedBackButton))
    }
    
    @objc private func touchedBackButton() {
        self.onTouchedBackButton?()
    }
}

//MARK: - IDetailsViewController
extension DetailsViewController: IDetailsViewController {
    func setIndexCar(index: Int) {
        self.detailsPresenter.setCarIndex(index: index)
    }
}

