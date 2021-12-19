//
//  TypeBodyTableViewCell.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

//MARK: - Class definition
class TypeBodyTableViewCell: UITableViewCell {
    
    static let id = "TypeBodyTableViewCell"
    
    var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Седан"
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGreen.cgColor
        return view
    }()
    
    var littleCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        return view
    }()
      
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.bodyLabel)
        self.addSubview(self.circleView)
        self.addSubview(self.littleCircleView)
        self.setupAutoLayot()
    }
    
    private func setupAutoLayot() {
        NSLayoutConstraint.activate([
            self.bodyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            self.bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.bodyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            self.bodyLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            self.circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            self.circleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            self.circleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17),
            self.circleView.heightAnchor.constraint(equalToConstant: 16),
            self.circleView.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            self.littleCircleView.topAnchor.constraint(equalTo: self.circleView.topAnchor, constant: 2),
            self.littleCircleView.leadingAnchor.constraint(equalTo: self.circleView.leadingAnchor, constant: 2),
            self.littleCircleView.trailingAnchor.constraint(equalTo: self.circleView.trailingAnchor, constant: -2),
            self.littleCircleView.bottomAnchor.constraint(equalTo: self.circleView.bottomAnchor, constant: -2),
            self.littleCircleView.heightAnchor.constraint(equalToConstant: 12),
            self.littleCircleView.widthAnchor.constraint(equalToConstant: 12)
        ])
    }
}
