//
//  SkillsCollectionViewCell.swift
//  cv
//
//  Created by pavel on 14.11.21.
//

import UIKit

class SkillsCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "SkillsCollectionViewCell"
    
    let skillImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let skillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Heavy", size: 15)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(skillImage)
        addSubview(skillLabel)
        
        NSLayoutConstraint.activate([
            skillImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            skillImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            skillImage.widthAnchor.constraint(equalToConstant: 40),
            skillImage.heightAnchor.constraint(equalToConstant: 40)])
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: skillImage.bottomAnchor, constant: 20),
            skillLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            skillLabel.widthAnchor.constraint(equalToConstant: 80),
            skillLabel.heightAnchor.constraint(equalToConstant: 30)])
    }
}
