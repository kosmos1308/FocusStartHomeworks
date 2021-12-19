//
//  DetailsView.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

//MARK: - Protocol definition
protocol IDetailsView: UIView {
    
    func setTypeBodyCars(typeBodyCars: [Body])
    func changeCircleColor(_ changed: Bool, index: Int)
    func changeImage(_ nameImage: String)
    func showPriceCar(_ price: String)
    func showDefaultPriceAndImage(price: String, image: String)
    
    var onTouchedCellHandler: ((Int) -> Void)? { get set }
    var onTouchedButton: (() -> Void)? { get set }
    var activityIndicatorView: UIActivityIndicatorView { get set }
    var typeBodyTableView: UITableView { get set }
}

//MARK: - Class definition
final class DetailsView: UIView {
    
    private var typeBodyArray = [Body]()
    private var isChangedColor: Bool = false
    
    var selectedIndex: Int = 0
    var onTouchedCellHandler: ((Int) -> Void)?
    var onTouchedButton: (() -> Void)?
    
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
        tableView.register(TypeBodyTableViewCell.self,
                           forCellReuseIdentifier: TypeBodyTableViewCell.id)
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
    
    var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.isHidden = true
        return indicator
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

//MARK: - private extension
private extension DetailsView {
    
    @objc func calculateButtonTapped() {
        self.onTouchedButton?()
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
        self.addSubview(self.activityIndicatorView)
        self.setupAutoLayout()
        self.configureTableView()
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.carImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.carImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.carImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -19),
            self.carImageView.heightAnchor.constraint(equalToConstant: 196)
        ])
        
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: 23),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.priceLabel.heightAnchor.constraint(equalToConstant: 29)
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
            self.typeBodyTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -61)
        ])
        
        NSLayoutConstraint.activate([
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.calculateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
        
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

//MARK: - IDetailsView
extension DetailsView: IDetailsView {
    func changeCircleColor(_ changed: Bool, index: Int) {
        self.isChangedColor = changed
        self.selectedIndex = index
    }
    
    func setTypeBodyCars(typeBodyCars: [Body]) {
        self.typeBodyArray = typeBodyCars
    }
    
    func showDefaultPriceAndImage(price: String, image: String) {
        self.moneyLabel.text = price
        self.carImageView.image = UIImage(named: image)
    }
    
    func changeImage(_ nameImage: String) {
        self.carImageView.image = UIImage(named: nameImage)
    }
    
    func showPriceCar(_ price: String) {
        self.moneyLabel.text = price
    }
}

//MARK: - UITableViewDataSource
extension DetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.typeBodyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = typeBodyTableView.dequeueReusableCell(withIdentifier: TypeBodyTableViewCell.id, for: indexPath)
        guard let typeBodyCell = cell as? TypeBodyTableViewCell else {return cell }
        typeBodyCell.bodyLabel.text = typeBodyArray[indexPath.row].rawValue
        
        if self.isChangedColor && selectedIndex == indexPath.row {
            typeBodyCell.littleCircleView.backgroundColor = .systemGreen
        } else {
            typeBodyCell.littleCircleView.backgroundColor = .clear
        }
        
        return typeBodyCell
    }
}

//MARK: - UITableViewDelegate
extension DetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrics.heightTypeBodyCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        typeBodyTableView.deselectRow(at: indexPath, animated: true)
        self.onTouchedCellHandler?(indexPath.row)
    }
}
