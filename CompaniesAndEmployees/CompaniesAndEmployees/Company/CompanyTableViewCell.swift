//
//  CompanyTableViewCell.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//

import UIKit

final class CompanyTableViewCell: UITableViewCell {
    
    static let id = "CompanyTableViewCell"
    
    lazy var nameCompanyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.nameCompanyLabel)
        self.setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.nameCompanyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.nameCompanyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameCompanyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameCompanyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

}
