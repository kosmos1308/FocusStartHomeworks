//
//  PhotosView.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 27.11.21.
//

import UIKit

final class PhotosView: UIView {
    
    private weak var controller: PhotosViewController?
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var photosCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.contentInsetAdjustmentBehavior = .always
        //cv.backgroundColor = .systemBlue
        return cv
    }()
    
    func configureView() {
        layout.scrollDirection = .vertical
        
        setupCollectionView()
        setupCollectionViewAutoLayout()
    }
    
    private func setupCollectionView() {
        photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        self.addSubview(photosCollectionView)
    }
    
    func setupCollectionViewAutoLayout() {
        photosCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photosCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photosCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photosCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func loadView(controller: PhotosViewController) {
        self.controller = controller
    }

}

extension PhotosView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        guard let photoCell = cell as? PhotosCollectionViewCell else {return cell}
        photoCell.backgroundColor = .systemRed
        
        return photoCell
    }
}


extension PhotosView: UICollectionViewDelegate {
    
}


extension PhotosView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let countItemsPerRow: CGFloat = 3
        let paddingWidth = Metrics.spacing * (countItemsPerRow + 1)
        let availableWidth = photosCollectionView.bounds.width - paddingWidth
        let widthItem = availableWidth / countItemsPerRow
        
        return CGSize(width: widthItem, height: widthItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: Metrics.spacing, left: Metrics.spacing, bottom: Metrics.spacing, right: Metrics.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return Metrics.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return Metrics.spacing
    }
}
