//
//  PhotosCollectionViewCell.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 27.11.21.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let id = "PhotosCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
    }
}
