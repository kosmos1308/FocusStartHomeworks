//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by pavel on 19.11.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let detailPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell Bold", size: 20)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 17)
        label.numberOfLines = 3
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("open description", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rockwell", size: 20)
        button.addTarget(self,
                         action: #selector(tapDetailButton(sender:)),
                         for: .touchUpInside)
        return button
    }()

    var text = ""
    var nameImage = ""
    var descriptionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupScrollView()
        showTextAndImage()
        setupScrollViewAutoLayout()
        setupDetailLabelAutoLayout()
        setupDetailPhotoImageViewAutoLayout()
        setupDescriptionLabelAutoLayout()
        setupDetailButtonAutoLayout()
    }
    
    //MARK: - setup scrollView
    func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.bounds.width,
                                        height: view.bounds.height + 100)
        view.addSubview(scrollView)
        scrollView.addSubview(detailLabel)
        scrollView.addSubview(detailPhotoImageView)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(detailButton)
    }
    
    
    //MARK: - show text and image
    func showTextAndImage() {
        detailLabel.text = text
        detailPhotoImageView.image = UIImage(named: nameImage)
        descriptionLabel.text = descriptionText
    }
    
    
    //MARK: - action detail button
    @objc func tapDetailButton(sender: UIButton) {
        let modalVC = ModalViewController()
        modalVC.detailText = descriptionText
        modalVC.modalPresentationStyle = .fullScreen
        navigationController?.present(modalVC, animated: true, completion: nil)
    }
    
    
    //MARK: - AutoLayout
    private func setupScrollViewAutoLayout() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func setupDetailLabelAutoLayout() {
        NSLayoutConstraint.activate([
            detailLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            detailLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,
                                             constant: Metrics.top/3),
            detailLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                              constant: Metrics.left),
            detailLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                               constant: Metrics.right),
            detailLabel.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
    
    private func setupDetailPhotoImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailPhotoImageView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor,
                                                      constant: Metrics.top/3),
            detailPhotoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            detailPhotoImageView.widthAnchor.constraint(equalToConstant: Metrics.width * 2),
            detailPhotoImageView.heightAnchor.constraint(equalToConstant: Metrics.width * 2)])
    }
    
    private func setupDescriptionLabelAutoLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: detailPhotoImageView.bottomAnchor,
                                                  constant: Metrics.top/3),
            descriptionLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                                   constant: Metrics.left),
            descriptionLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                                    constant: Metrics.right),
            descriptionLabel.heightAnchor.constraint(equalToConstant: Metrics.height/2)])
    }
    
    private func setupDetailButtonAutoLayout() {
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                              constant: Metrics.bottom),
            detailButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor,
                                               constant: Metrics.left),
            detailButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor,
                                                constant: Metrics.right),
            detailButton.heightAnchor.constraint(equalToConstant: Metrics.height/3),
            detailButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
                                                 constant: -(scrollView.bounds.height + detailButton.bounds.height))])
    }
}
