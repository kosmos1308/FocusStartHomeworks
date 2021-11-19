//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by pavel on 19.11.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detaitlPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    
        setupDetailPhotoImageViewAutoLayout()
        
    }
    
    private func setupDetailPhotoImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            detaitlPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detaitlPhotoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detaitlPhotoImageView.widthAnchor.constraint(equalToConstant: 200),
            detaitlPhotoImageView.heightAnchor.constraint(equalToConstant: 200)])
    }



}
