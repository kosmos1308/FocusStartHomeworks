//
//  SecondViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import UIKit

//MARK: - protocol definition
protocol IDetailViewController {
    func presentVC(vc: UIViewController)
}

//MARK: - class definition
final class DetailViewController: UIViewController {
    
    private var detailView: IDetailView
    private var presenter: IDetailPresenter
    
    init(presenter: IDetailPresenter) {
        self.detailView = DetailView(frame: UIScreen.main.bounds)
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.presenter.loadView(controller: self, view: detailView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(detailView)
    }
}

//MARK: - IDetailViewController
extension DetailViewController: IDetailViewController {
    func presentVC(vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
