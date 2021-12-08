//
//  DetailsViewController.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    private var detailsView: DetailsView?
    
    init() {
        self.detailsView = DetailsView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.detailsView?.loadView(controler: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNavBar()
        
        self.detailsView?.typeBodyTableView.delegate = self
        self.detailsView?.typeBodyTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.detailsView?.configureView()
        guard let detailsView = detailsView else {
            return
        }
        self.view.addSubview(detailsView)
    }
    
    private func updateNavBar() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
    }
    
}

//MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsView?.typeBodyTableView.dequeueReusableCell(withIdentifier: TypeBodyTableViewCell.id, for: indexPath)
        guard let typeBodyCell = cell as? TypeBodyTableViewCell else {return cell ?? UITableViewCell() }
        
        return typeBodyCell
    }
}

//MARK: - UITableViewDelegate
extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 51
    }
}
