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
        button.layer.cornerRadius = 17
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .systemRed

        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemBackground
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        
        setupCloseButtonAutoLayout()
        
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
    
    
}
