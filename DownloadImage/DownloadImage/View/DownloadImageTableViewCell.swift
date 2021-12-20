//
//  DownloadImageTableViewCell.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

class DownloadImageTableViewCell: UITableViewCell {
    
    static let id = "DownloadImageTableViewCell"
    
    lazy var pictureImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .darkGray
        img.layer.cornerRadius = Metrics.cornerRadius
        return img
    }()
    
    lazy var nameImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        label.backgroundColor = .systemMint
        return label
    }()
    
    lazy var progressLoadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = .systemRed
        return label
    }()
    
    lazy var downloadMbLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.backgroundColor = .systemMint
        return label
    }()
    
    lazy var progressView: UIProgressView = {
        lazy var progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = .systemMint
        return progressView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.pictureImageView)
        self.addSubview(self.nameImageLabel)
        self.addSubview(self.progressLoadLabel)
        self.addSubview(self.downloadMbLabel)
        self.addSubview(self.progressView)
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
            self.progressLoadLabel.leadingAnchor.constraint(equalTo: self.pictureImageView.trailingAnchor, constant: Metrics.leading),
            self.progressLoadLabel.topAnchor.constraint(equalTo: self.nameImageLabel.bottomAnchor),
            self.progressLoadLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.progressLoadLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.downloadMbLabel.leadingAnchor.constraint(equalTo: self.pictureImageView.trailingAnchor, constant: Metrics.leading),
            self.downloadMbLabel.topAnchor.constraint(equalTo: self.progressLoadLabel.bottomAnchor),
            self.downloadMbLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.downloadMbLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.progressView.leadingAnchor.constraint(equalTo: self.pictureImageView.trailingAnchor, constant: Metrics.leading),
            self.progressView.topAnchor.constraint(equalTo: self.downloadMbLabel.bottomAnchor, constant: Metrics.top/2),
            self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.progressView.heightAnchor.constraint(equalToConstant: Metrics.heightProgressView)
        ])
    }
}
