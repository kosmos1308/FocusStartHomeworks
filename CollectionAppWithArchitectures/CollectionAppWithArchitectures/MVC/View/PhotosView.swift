//
//  PhotosView.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 27.11.21.
//

import UIKit

final class PhotosView: UIView {
    
    private weak var controller: PhotosViewController?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    lazy var photosCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentInsetAdjustmentBehavior = .always
        cv.clipsToBounds = true
        return cv
    }()
    
    
    //MARK: -
    func configureView() {
        setupCollectionView()
        setupCollectionViewAutoLayout()
    }
    
    func loadView(controller: PhotosViewController) {
        self.controller = controller
    }
    
    //MARK: - get Data
    func getData() {
        
        
    }
  
    //MARK: - AutoLayout
    func setupCollectionViewAutoLayout() {
        photosCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photosCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photosCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        photosCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        photosCollectionView.register(PhotosCollectionViewCell.self,
                                      forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        self.addSubview(photosCollectionView)
    }
}

