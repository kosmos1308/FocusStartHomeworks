//
//  TypeBodyTableViewCell.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

class TypeBodyTableViewCell: UITableViewCell {
    
    static let id = "TypeBodyTableViewCell"
    
    private lazy var bodyLabel: UILabel = {
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
    
    private lazy var circleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)
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
        
        self.addSubview(self.bodyLabel)
        self.addSubview(self.circleView)
        self.circleView.addSubview(self.circleButton)
        setupAutoLayot()
    }
    
    @objc private func circleButtonTapped() {
        print("press circle")
    }
    
    private func setupAutoLayot() {
        NSLayoutConstraint.activate([
            self.bodyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            self.bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.bodyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            self.circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            self.circleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            self.circleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17),
            self.circleView.heightAnchor.constraint(equalToConstant: 16),
            self.circleView.widthAnchor.constraint(equalToConstant: 16)
            
        ])
        
        NSLayoutConstraint.activate([
            self.circleButton.topAnchor.constraint(equalTo: self.circleView.topAnchor, constant: 2),
            self.circleButton.leadingAnchor.constraint(equalTo: self.circleView.leadingAnchor, constant: 2),
            self.circleButton.trailingAnchor.constraint(equalTo: self.circleView.trailingAnchor, constant: -2),
            self.circleButton.bottomAnchor.constraint(equalTo: self.circleView.bottomAnchor, constant: -2),
            self.circleButton.heightAnchor.constraint(equalToConstant: 12),
            self.circleButton.widthAnchor.constraint(equalToConstant: 12)
        ])
    }
}
