//
//  SecondView.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import UIKit

class DetailView: UIView {

    var onTouchedHandler: (() -> Void)?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemPink
        return label
    }()
    
    lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray
        return label
    }()
    
    private lazy var detailButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Open description", for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)
           button.titleLabel?.font = UIFont(name: "Futura", size: 20)
           button.addTarget(self, action: #selector(touchDetailButton), for: .touchUpInside)
           return button
       }()
    
    func configView() {
        addSubview(titleLabel)
        addSubview(detailImageView)
        addSubview(descriptionLabel)
        addSubview(detailButton)
        
        setupTitleLabelAutoLayout()
        setupDetailImageViewAutoLayout()
        setupDescriptionLabelAutoLayout()
        setupDetailButtonAutoLayout()
    }
    
    @objc func touchDetailButton() {
        self.onTouchedHandler?()
    }
    
    func updateView(title: String, nameImage: String, description: String) {
        titleLabel.text = title
        detailImageView.image = UIImage(named: nameImage)
        descriptionLabel.text = description
    }
    
    
    //MARK: - AutoLayout
    private func setupTitleLabelAutoLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top * 6),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            titleLabel.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
    
    private func setupDetailImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            detailImageView.widthAnchor.constraint(equalToConstant: Metrics.width * 2),
            detailImageView.heightAnchor.constraint(equalToConstant: Metrics.width * 2)])
    }
    
    private func setupDescriptionLabelAutoLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            descriptionLabel.heightAnchor.constraint(equalToConstant: Metrics.height/2)])
    }
    
    private func setupDetailButtonAutoLayout() {
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.bottom),
            detailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            detailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            detailButton.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
}
