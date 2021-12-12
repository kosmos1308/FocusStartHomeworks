//
//  SecondView.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 29.11.21.
//

import UIKit

//MARK: - protocol definition
protocol IDetailView: UIView {
    var onTouchedHandler: (() -> Void)? { get set }
    func updateView(title: String, nameImage: String, description: String)
}

//MARK: - class definition
final class DetailView: UIView {

    var onTouchedHandler: (() -> Void)?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Futura Bold", size: 20)
        return label
    }()
    
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 17)
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open description", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura", size: 20)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = Metrics.cornerRadius
        button.addTarget(self, action: #selector(touchDetailButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private extension
private extension DetailView {
    func configView() {
        self.addSubview(titleLabel)
        self.addSubview(detailImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(detailButton)
        
        setupTitleLabelAutoLayout()
        setupDetailImageViewAutoLayout()
        setupDescriptionLabelAutoLayout()
        setupDetailButtonAutoLayout()
    }
    
    @objc private func touchDetailButton() {
        self.onTouchedHandler?()
    }
    
    //AutoLayout
    private func setupTitleLabelAutoLayout() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top * 6),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            self.titleLabel.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
    
    private func setupDetailImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            self.detailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.detailImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.top/2),
            self.detailImageView.widthAnchor.constraint(equalToConstant: Metrics.width * 2),
            self.detailImageView.heightAnchor.constraint(equalToConstant: Metrics.width * 2)])
    }
    
    private func setupDescriptionLabelAutoLayout() {
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            self.descriptionLabel.heightAnchor.constraint(equalToConstant: Metrics.height/1.5)])
    }
    
    private func setupDetailButtonAutoLayout() {
        NSLayoutConstraint.activate([
            self.detailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.top),
            self.detailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            self.detailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            self.detailButton.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
}

//MARK: - IDetailView
extension DetailView: IDetailView {
    func updateView(title: String, nameImage: String, description: String) {
        self.titleLabel.text = title
        self.detailImageView.image = UIImage(named: nameImage)
        self.descriptionLabel.text = description
    }
}
