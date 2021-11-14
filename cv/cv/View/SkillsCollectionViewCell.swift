//
//  SkillsCollectionViewCell.swift
//  cv
//
//  Created by pavel on 14.11.21.
//

import UIKit

class SkillsCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "SkillsCollectionViewCell"
    
    let skillView = UIView()
    let skillImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .systemGray
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
    let skillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 15)
        label.numberOfLines = 2
        label.backgroundColor = .systemRed
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(skillImage)
        addSubview(skillLabel)
        
        skillImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        skillImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        //skillImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20).isActive = true
        skillImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        skillImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        skillLabel.topAnchor.constraint(equalTo: skillImage.bottomAnchor, constant: 20).isActive = true
        skillLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        skillLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        skillLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
