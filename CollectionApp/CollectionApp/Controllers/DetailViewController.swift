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
        imageView.contentMode = .scaleAspectFill
        //imageView.sizeToFit()
        return imageView
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell", size: 20)
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open modal window", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rockwell", size: 20)
        button.addTarget(self, action: #selector(tapDetailButton(sender:)), for: .touchUpInside)
        return button
    }()

    var text = ""
    var nameImage = ""
    var descriptionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(detailPhotoImageView)
        view.addSubview(detailLabel)
        view.addSubview(detailButton)
        
        setupDetailPhotoImageViewAutoLayout()
        setupDetailLabelViewAutoLayout()
        setupDetailButtonViewAutoLayout()
        
        detailLabel.text = text
        detailPhotoImageView.image = UIImage(named: nameImage)
        
    }
    
    //MARK: - action detail button
    @objc func tapDetailButton(sender: UIButton) {
        let modalVC = ModalViewController()
        modalVC.detailText = descriptionText
        navigationController?.present(modalVC, animated: true, completion: nil)
    }
    
    
    //MARK: - AutoLayout
    private func setupDetailPhotoImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailPhotoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailPhotoImageView.widthAnchor.constraint(equalToConstant: Metrics.width * 2),
            detailPhotoImageView.heightAnchor.constraint(equalToConstant: Metrics.width * 2)])
    }
    
    private func setupDetailLabelViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: detailPhotoImageView.bottomAnchor, constant: Metrics.top * 2),
            detailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Metrics.left),
            detailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Metrics.right),
            detailLabel.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
    
    private func setupDetailButtonViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: Metrics.top),
            detailButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Metrics.left),
            detailButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Metrics.right),
            detailButton.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }

}
