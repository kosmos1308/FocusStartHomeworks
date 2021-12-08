//
//  DetailsView.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class DetailsView: UIView {
    
    private var detailsPresenter: DetailsPresenter? 
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Цена"
        label.font = UIFont(name: "Inter-Medium", size: 24)
        return label
    }()
    
    private lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12121$"
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        return label
    }()
    
    private lazy var typeBodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выберите тип кузова"
        label.font = UIFont(name: "Inter-Medium", size: 24)
        return label
    }()
    
    lazy var typeBodyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TypeBodyTableViewCell.self, forCellReuseIdentifier: TypeBodyTableViewCell.id)
        return tableView
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Рассчитать цену", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 25
        button.addTarget(self,
                         action: #selector(calculateButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView(controler: DetailsViewController) {
        self.detailsPresenter?.loadView(controller: controler, view: self)
    }
    
    func setPresenter(presenter: DetailsPresenter) {
        self.detailsPresenter = DetailsPresenter()
        self.detailsPresenter = presenter
    }
    
    func configureView() {
        self.addSubview(self.carImageView)
        self.addSubview(self.priceLabel)
        self.addSubview(self.moneyLabel)
        self.addSubview(self.typeBodyLabel)
        self.addSubview(self.typeBodyTableView)
        self.addSubview(self.calculateButton)
        setupAutoLayout()
    }
    
    @objc private func calculateButtonTapped() {
        print("button press")
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.carImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 13),
            self.carImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.carImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19),
            self.carImageView.heightAnchor.constraint(equalToConstant: 196)
        ])
        
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: 23),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        NSLayoutConstraint.activate([
            self.moneyLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 8),
            self.moneyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.moneyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.moneyLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            self.typeBodyLabel.topAnchor.constraint(equalTo: self.moneyLabel.bottomAnchor, constant: 23),
            self.typeBodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.typeBodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.typeBodyLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
        
        NSLayoutConstraint.activate([
            self.typeBodyTableView.topAnchor.constraint(equalTo: self.typeBodyLabel.bottomAnchor, constant: 1),
            self.typeBodyTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.typeBodyTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.typeBodyTableView.heightAnchor.constraint(equalToConstant: 51 * 4)
            //self.typeBodyTableView.bottomAnchor.constraint(equalTo: self.calculateButton.topAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            self.calculateButton.topAnchor.constraint(equalTo: self.typeBodyTableView.bottomAnchor, constant: 109),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            //self.calculateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 90),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
        
        
        
    }

}
