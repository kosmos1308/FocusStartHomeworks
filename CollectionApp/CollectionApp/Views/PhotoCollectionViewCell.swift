//
//  PhotoCollectionViewCell.swift
//  CollectionApp
//
//  Created by pavel on 19.11.21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let id = "PhotoCollectionViewCell"
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .darkGray
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = Metrics.cornerRadius
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //imageView.sizeToFit()
        
        return imageView
    }()
    
    let namePhotoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Rockwell", size: 20)
        
        return label
    }()
    
    
    let gradient = CAGradientLayer()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray5
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = Metrics.cornerRadius
        contentView.addSubview(photoImageView)
        contentView.addSubview(namePhotoLabel)
        
        gradient.frame = contentView.bounds
        gradient.contents = photoImageView.image?.cgImage
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        photoImageView.layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Metrics.left/2).isActive = true
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.top/2).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Metrics.right/2).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height + Metrics.right).isActive = true
        
        namePhotoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Metrics.left).isActive = true
        namePhotoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Metrics.right).isActive = true
        namePhotoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Metrics.right).isActive = true
        namePhotoLabel.heightAnchor.constraint(equalToConstant: Metrics.height/5).isActive = true
    }
    
}
