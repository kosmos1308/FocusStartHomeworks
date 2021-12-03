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
        addSubview(titleLabel)
        addSubview(detailImageView)
        addSubview(descriptionLabel)
        addSubview(detailButton)
        
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
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top * 6),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            titleLabel.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
    
    private func setupDetailImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            detailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.top/2),
            detailImageView.widthAnchor.constraint(equalToConstant: Metrics.width * 2),
            detailImageView.heightAnchor.constraint(equalToConstant: Metrics.width * 2)])
    }
    
    private func setupDescriptionLabelAutoLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            descriptionLabel.heightAnchor.constraint(equalToConstant: Metrics.height/1.5)])
    }
    
    private func setupDetailButtonAutoLayout() {
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.top),
            detailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Metrics.left),
            detailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Metrics.right),
            detailButton.heightAnchor.constraint(equalToConstant: Metrics.height/3)])
    }
}

//MARK: - IDetailView
extension DetailView: IDetailView {
    func updateView(title: String, nameImage: String, description: String) {
        titleLabel.text = title
        detailImageView.image = UIImage(named: nameImage)
        descriptionLabel.text = description
    }
}
