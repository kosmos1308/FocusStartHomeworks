//
//  ChooseView.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

//MARK: - Protocol definition
protocol IChooseView: UIView {
    var onTouchedIndexCell: ((Int) -> Void)? { get set }
    var carsTableView: UITableView { get set }
    var titleLabel: UILabel { get set }
    func setContentLabel(text: PresentContent)
}


//MARK: - Class definition
final class ChooseView: UIView {
    
    private var choosePresenter: IChoosePresenter?
    private var chooseVC: ChooseViewController?
    
    var onTouchedIndexCell: ((Int) -> Void)?
    var carsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChooseCarTableViewCell.self,
                           forCellReuseIdentifier: ChooseCarTableViewCell.id)
        return tableView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-SemiBold", size: 30)
        return label
    }()

    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Inter-Medium", size: 24)
        return label
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

//MARK: - Private extension
private extension ChooseView {
    func configureView() {
        self.addSubview(self.modelLabel)
        self.addSubview(self.carsTableView)
        self.setupAutoLayot()
    }
    
    func setupAutoLayot() {
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

//MARK: - IChooseView
extension ChooseView: IChooseView {
    func setContentLabel(text: PresentContent) {
        self.modelLabel.text = text.labelText
        self.titleLabel.text = text.navigationBarText
    }
}
