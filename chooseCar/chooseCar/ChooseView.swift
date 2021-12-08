//
//  ChooseView.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

class ChooseView: UIView {
    
    //private weak var choosePresenter: ChoosePresenter?
    private weak var chooseVC: ChooseViewController?

    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Марку машины"
        label.font = UIFont(name: "Inter-Medium", size: 24)
        return label
    }()
    
    lazy var carsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChooseCarTableViewCell.self,
                           forCellReuseIdentifier: ChooseCarTableViewCell.id)
        return tableView
    }()
    
    
    func loadView(controller: ChooseViewController) {
        self.chooseVC = controller
    }
    
    func configureView() {
        
        addSubview(modelLabel)
        addSubview(carsTableView)
        setupAutoLayot()
    }
    
    private func setupAutoLayot() {
        NSLayoutConstraint.activate([
            modelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 139),
            modelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            modelLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            modelLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        NSLayoutConstraint.activate([
            carsTableView.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 12),
            carsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            carsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            carsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
