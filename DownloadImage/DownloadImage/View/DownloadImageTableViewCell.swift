//
//  DownloadImageTableViewCell.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

final class DownloadImageTableViewCell: UITableViewCell {
    
    static let id = "DownloadImageTableViewCell"
    
    lazy var pictureImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = Metrics.cornerRadius
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var nameImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var downloadMbLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.pictureImageView)
        self.addSubview(self.nameImageLabel)
        self.addSubview(self.downloadMbLabel)
        self.setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.pictureImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top),
            self.pictureImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.pictureImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottom),
            self.pictureImageView.widthAnchor.constraint(equalToConstant: Metrics.heightImage),
            self.pictureImageView.heightAnchor.constraint(equalToConstant: Metrics.heightImage)
        ])
     
        NSLayoutConstraint.activate([
            self.nameImageLabel.leadingAnchor.constraint(equalTo: self.pictureImageView.trailingAnchor, constant: Metrics.leading),
            self.nameImageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top),
            self.nameImageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.nameImageLabel.heightAnchor.constraint(equalToConstant: Metrics.heightNameLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.downloadMbLabel.leadingAnchor.constraint(equalTo: self.pictureImageView.trailingAnchor, constant: Metrics.leading),
            self.downloadMbLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottom),
            self.downloadMbLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.downloadMbLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
    }
}
