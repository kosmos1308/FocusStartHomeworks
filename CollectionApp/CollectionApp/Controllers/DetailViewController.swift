//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by pavel on 19.11.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open modal window", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(detailPhotoImageView)
        view.addSubview(detailLabel)
        view.addSubview(detailButton)
        
        detailButton.addTarget(self, action: #selector(tapDetailButton(sender:)), for: .touchUpInside)
        
        setupDetailPhotoImageViewAutoLayout()
        setupDetailLabelViewAutoLayout()
        setupDetailButtonViewAutoLayout()
    }
    
    //MARK: - action detail button
    @objc func tapDetailButton(sender: UIButton) {
        let modalVC = ModalViewController()
        navigationController?.present(modalVC, animated: true, completion: nil)
    }
    
    
    //MARK: - AutoLayout
    private func setupDetailPhotoImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailPhotoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailPhotoImageView.widthAnchor.constraint(equalToConstant: 200),
            detailPhotoImageView.heightAnchor.constraint(equalToConstant: 200)])
    }
    
    private func setupDetailLabelViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: detailPhotoImageView.bottomAnchor, constant: 10),
            detailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            detailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            detailLabel.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    private func setupDetailButtonViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 20),
            detailButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            detailButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            detailButton.heightAnchor.constraint(equalToConstant: 40)])
    }

}
