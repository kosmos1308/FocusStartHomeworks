//
//  ModalViewController.swift
//  CollectionApp
//
//  Created by pavel on 19.11.21.
//

import UIKit

class ModalViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .systemRed
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        return button
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .systemGray5
        label.font = UIFont(name: "Rockwell", size: 17)
        return label
        
    }()
    
    var detailText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(descriptionLabel)
        
        descriptionLabel.text = detailText
        
        setupCloseButtonAutoLayout()
        setupDescriptionLabelAutoLayout()
    }
    
    
    @objc func tapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - AutoLayout
    private func setupCloseButtonAutoLayout() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Metrics.top/2),
            closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Metrics.left/2),
            closeButton.widthAnchor.constraint(equalToConstant: Metrics.width/4),
            closeButton.heightAnchor.constraint(equalToConstant: Metrics.width/4)])
    }
    
    private func setupDescriptionLabelAutoLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Metrics.top * 2),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Metrics.left),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Metrics.right),
            descriptionLabel.heightAnchor.constraint(equalToConstant: view.bounds.height - Metrics.height)])
    }
    
    
}
