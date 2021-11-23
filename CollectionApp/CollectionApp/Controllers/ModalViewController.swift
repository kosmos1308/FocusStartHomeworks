//
//  ModalViewController.swift
//  CollectionApp
//
//  Created by pavel on 19.11.21.
//

import UIKit

final class ModalViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemRed
        button.layer.cornerRadius = Metrics.cornerRadius * 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.addTarget(self,
                         action: #selector(tapCloseButton),
                         for: .touchUpInside)
        return button
    }()
    
    private let descrptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Rockwell", size: 17)
        textView.isEditable = false
        return textView
    }()
    
    var detailText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(descrptionTextView)
        
        descrptionTextView.text = detailText
    
        setupCloseButtonAutoLayout()
        setupDescriptionTextViewAutoLayout()
    }
    
    
    //MARK: - action closeButton
    @objc func tapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - AutoLayout
    private func setupCloseButtonAutoLayout() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Metrics.top * 2),
            closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Metrics.left),
            closeButton.widthAnchor.constraint(equalToConstant: Metrics.cornerRadius * 4),
            closeButton.heightAnchor.constraint(equalToConstant: Metrics.cornerRadius * 4)])
    }
    
    private func setupDescriptionTextViewAutoLayout() {
        NSLayoutConstraint.activate([
            descrptionTextView.topAnchor.constraint(equalTo: closeButton.bottomAnchor,
                                                    constant: Metrics.bottom + Metrics.top/3),
            descrptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                     constant: Metrics.left),
            descrptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                      constant: Metrics.right * 2),
            descrptionTextView.heightAnchor.constraint(equalToConstant: view.bounds.height - Metrics.height)])
    }
}
