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
        imageView.image = UIImage(systemName: "person")
        return imageView
    }()
    
    let namePhotoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.text = "Some text"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(photoImageView)
        contentView.addSubview(namePhotoLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 20).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width - 20).isActive = true
        //photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 - namePhotoLabel.bounds.height - 5).isActive = true
        //photoImageView.heightAnchor.constraint(equalToConstant: photoImageView.bounds.width).isActive = true
        
        
        namePhotoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        namePhotoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        namePhotoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        namePhotoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}
