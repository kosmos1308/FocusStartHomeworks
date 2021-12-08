//
//  ChooseCarTableViewCell.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

class ChooseCarTableViewCell: UITableViewCell {
    
    static let id = "ChooseCarTableViewCell"
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private lazy var modelCarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.text = "Audi"
        return label
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.iconView)
        self.addSubview(self.modelCarLabel)
        self.addSubview(self.selectButton)
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
            self.selectButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.selectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.selectButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            self.selectButton.heightAnchor.constraint(equalToConstant: 17),
            self.selectButton.widthAnchor.constraint(equalToConstant: 42)
        ])
    }
}
