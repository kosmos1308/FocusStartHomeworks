//
//  SkillsCollectionViewCell.swift
//  cv
//
//  Created by pavel on 14.11.21.
//

import UIKit

final class SkillsCollectionViewCell: UICollectionViewCell {
    
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
            skillImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.left),
            skillImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Metrics.bottom),
            skillImage.widthAnchor.constraint(equalToConstant: Metrics.left * 2),
            skillImage.heightAnchor.constraint(equalToConstant: Metrics.left * 2)])
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: skillImage.bottomAnchor, constant: Metrics.left),
            skillLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Metrics.left/2),
            skillLabel.widthAnchor.constraint(equalToConstant: Metrics.left * 4),
            skillLabel.heightAnchor.constraint(equalToConstant: Metrics.left * 1.5)])
    }
}
