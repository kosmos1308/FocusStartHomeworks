//
//  ChooseView.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class ChooseView: UIView {
    
    private var choosePresenter: ChoosePresenter?

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
    
    //view ->(view, controller) -> presenter
    func loadView(controller: ChooseViewController) {
        self.choosePresenter?.loadView(controller: controller, view: self)
    }
    
    func setPresenter(presenter: ChoosePresenter) {
        self.choosePresenter = ChoosePresenter()
        self.choosePresenter = presenter
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.addSubview(self.modelLabel)
        self.addSubview(self.carsTableView)
        setupAutoLayot()
    }
    
    private func setupAutoLayot() {
        NSLayoutConstraint.activate([
            self.modelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 139),
            self.modelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.modelLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            self.modelLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        NSLayoutConstraint.activate([
            self.carsTableView.topAnchor.constraint(equalTo: self.modelLabel.bottomAnchor, constant: 12),
            self.carsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.carsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.carsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
