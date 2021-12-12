//
//  ModalView.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 30.11.21.
//

import UIKit

//MARK: - class definition
final class ModalView: UIView {
    
    var onTouchedHandler: (() -> Void)?
    private weak var controller: ModalViewController?

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemRed
        button.layer.cornerRadius = Metrics.top
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.addTarget(self, action: #selector(touchCloseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Futura", size: 17)
        textView.isEditable = false
        return textView
    }()
    
    func configureView() {
        self.backgroundColor = .white
        
        addSubview(closeButton)
        addSubview(descriptionTextView)
        
        setupDescriptionAutoLayout()
        setupCloseButtonAutoLayout()
    }
    
    func loadView(controller: ModalViewController) {
        self.controller = controller
    }
}

//MARK: - private extension
private extension ModalView {
    private func setupCloseButtonAutoLayout() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top * 3),
            closeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            closeButton.heightAnchor.constraint(equalToConstant: Metrics.height/3),
            closeButton.widthAnchor.constraint(equalToConstant: Metrics.height/3)
        ])
    }
    
    private func setupDescriptionAutoLayout() {
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top * 6),
            descriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.right)
        ])
    }
    
    @objc private func touchCloseButton() {
        self.onTouchedHandler?()
    }
}
