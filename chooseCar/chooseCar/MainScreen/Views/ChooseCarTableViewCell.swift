//
//  ChooseCarTableViewCell.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class ChooseCarTableViewCell: UITableViewCell {
    
    static let id = "ChooseCarTableViewCell"
    var onTouchedHandler: (() -> Void)?
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGreen
        return view
    }()
    
    lazy var modelCarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()
    
    private lazy var selectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.text = "Select"
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.iconView)
        self.addSubview(self.modelCarLabel)
        self.addSubview(self.selectLabel)
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.iconView.heightAnchor.constraint(equalToConstant: 16),
            self.iconView.widthAnchor.constraint(equalToConstant: 16),
            self.iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.iconView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17)
        ])
        
        NSLayoutConstraint.activate([
            self.modelCarLabel.leadingAnchor.constraint(equalTo: self.iconView.trailingAnchor, constant: 16),
            self.modelCarLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.modelCarLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.modelCarLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            self.selectLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.selectLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.selectLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            self.selectLabel.heightAnchor.constraint(equalToConstant: 17),
            self.selectLabel.widthAnchor.constraint(equalToConstant: 42)
        ])
    }
}
