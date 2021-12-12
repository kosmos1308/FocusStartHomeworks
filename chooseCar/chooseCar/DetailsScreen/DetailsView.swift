//
//  DetailsView.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

protocol IDetailsView: UIView {
    var typeBodyTableView: UITableView { get set }
    func setTypeBodyCars(typeBodyCars: [Body])
    func changeCircleColor(_ changed: Bool, index: Int)
    
    
    func changeImage(_ nameImage: String)
    func showPriceCar(_ price: String)
    func showDefaultPriceAndBody(price: String, body: String, image: String)
    
    var onTouchedHandler: ((Int) -> Void)? { get set }
}

final class DetailsView: UIView {
    
    private var typeBodyArray = [Body]()
    private var isChangedColor: Bool = false
    private var selectedIndex: Int = 0
    var onTouchedHandler: ((Int) -> Void)?
    
    private var detailsPresenter: IDetailsPresenter?
    private var detailsVC: IDetailsViewController?
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
    
    var typeBodyTableView: UITableView = {
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
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailsView {
    
    @objc private func calculateButtonTapped() {
        //self.onTouchedHandler?()
    }
    
    func configureTableView() {
        self.typeBodyTableView.delegate = self
        self.typeBodyTableView.dataSource = self
    }
    
    func configureView() {
        self.addSubview(self.carImageView)
        self.addSubview(self.priceLabel)
        self.addSubview(self.moneyLabel)
        self.addSubview(self.typeBodyLabel)
        self.addSubview(self.typeBodyTableView)
        self.addSubview(self.calculateButton)
        setupAutoLayout()
        configureTableView()
    }
    
    func setupAutoLayout() {
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
            self.calculateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 90),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}

extension DetailsView: IDetailsView {
    func changeCircleColor(_ changed: Bool, index: Int) {
        self.isChangedColor = changed
        self.selectedIndex = index
    }
    
    func setTypeBodyCars(typeBodyCars: [Body]) {
        self.typeBodyArray = typeBodyCars
    }
    
    func showDefaultPriceAndBody(price: String, body: String, image: String) {
        self.moneyLabel.text = price
        self.carImageView.image = UIImage(named: image)
        //body
    }
    
    func changeImage(_ nameImage: String) {
        self.carImageView.image = UIImage(named: nameImage)
    }
    
    func showPriceCar(_ price: String) {
        self.moneyLabel.text = price
    }
    
}

extension DetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return typeBodyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = typeBodyTableView.dequeueReusableCell(withIdentifier: TypeBodyTableViewCell.id, for: indexPath)
        guard let typeBodyCell = cell as? TypeBodyTableViewCell else {return cell }
        typeBodyCell.bodyLabel.text = typeBodyArray[indexPath.row].rawValue
//        typeBodyCell.littleCircleView.backgroundColor = self.isChangedColor && (self.selectedIndex != 0) ? .systemGreen : .clear
        
        return typeBodyCell
    }
}

extension DetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 51
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //handler
        //self.index = indexPath.row
        
        //changeCircleColor(true, index: index)
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedIndex = indexPath.row
        self.onTouchedHandler?(indexPath.row)
        
        
        let indexesToRedraw = [indexPath]
        selectedIndex = indexPath.row
                // Do what you need here
        tableView.reloadRows(at: indexesToRedraw, with: .fade)
                // go to next "page"
        
    }
    
}



