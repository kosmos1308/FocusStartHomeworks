//
//  ChooseCarTableViewCell.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class ChooseCarTableViewCell: UITableViewCell {
    
    static let id = "ChooseCarTableViewCell"
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Metrics.cornerRadiusIcon
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
        self.setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.iconView.heightAnchor.constraint(equalToConstant: Metrics.heightIcon),
            self.iconView.widthAnchor.constraint(equalToConstant: Metrics.heightIcon),
            self.iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.topIcon),
            self.iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.iconView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottomIcon)
        ])
        
        NSLayoutConstraint.activate([
            self.modelCarLabel.leadingAnchor.constraint(equalTo: self.iconView.trailingAnchor, constant: Metrics.leading),
            self.modelCarLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.topLabel),
            self.modelCarLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.trailing),
            self.modelCarLabel.heightAnchor.constraint(equalToConstant: Metrics.heightModelCarLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.selectLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.topLabel),
            self.selectLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.selectLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottomSelectLabel),
            self.selectLabel.heightAnchor.constraint(equalToConstant: Metrics.heightSelectLabel),
            self.selectLabel.widthAnchor.constraint(equalToConstant: Metrics.widthLabel)
        ])
    }
}
