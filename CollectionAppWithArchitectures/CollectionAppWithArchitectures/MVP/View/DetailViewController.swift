//
//  SecondViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailView: DetailView
    private var presenter: Presenter
    
    init() {
        self.detailView = DetailView(frame: UIScreen.main.bounds)
        self.presenter = Presenter()
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
