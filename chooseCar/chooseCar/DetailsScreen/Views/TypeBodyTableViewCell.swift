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
        view.layer.cornerRadius = Metrics.cornerRadiusCircle
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGreen.cgColor
        return view
    }()
    
    var littleCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Metrics.cornerRadiusLittleCircle
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
            self.bodyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.topBodyLabel),
            self.bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.bodyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottomBodyLabel),
            self.bodyLabel.widthAnchor.constraint(equalToConstant: Metrics.widthBodyLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.topCircle),
            self.circleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailingCircle),
            self.circleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottomCircle),
            self.circleView.heightAnchor.constraint(equalToConstant: Metrics.heightCircle),
            self.circleView.widthAnchor.constraint(equalToConstant: Metrics.heightCircle)
        ])
        
        NSLayoutConstraint.activate([
            self.littleCircleView.topAnchor.constraint(equalTo: self.circleView.topAnchor, constant: Metrics.spacingLittleCircle),
            self.littleCircleView.leadingAnchor.constraint(equalTo: self.circleView.leadingAnchor, constant: Metrics.spacingLittleCircle),
            self.littleCircleView.trailingAnchor.constraint(equalTo: self.circleView.trailingAnchor, constant: -Metrics.spacingLittleCircle),
            self.littleCircleView.bottomAnchor.constraint(equalTo: self.circleView.bottomAnchor, constant: -Metrics.spacingLittleCircle),
            self.littleCircleView.heightAnchor.constraint(equalToConstant: Metrics.heightLittleCircle),
            self.littleCircleView.widthAnchor.constraint(equalToConstant: Metrics.heightLittleCircle)
        ])
    }
}
