//
//  PhotosViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 27.11.21.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private var photosView: PhotosView?
    
    override func loadView() {
        super.loadView()
        
        photosView = PhotosView(frame: UIScreen.main.bounds)
        photosView?.loadView(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateNavigationBar()

        guard let photosView = photosView else { return }
        view.addSubview(photosView)
        
        photosView.photosCollectionView.delegate = self
        photosView.photosCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        photosView?.configureView()
    }
    
    private func updateNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Photos"
    }
}

//MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Photo.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = photosView?.photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath)
        guard let photoCell = cell as? PhotosCollectionViewCell else {return cell!}
        photoCell.backgroundColor = .white
        photoCell.layer.cornerRadius = 10
        photoCell.layer.borderColor = UIColor.black.cgColor
        photoCell.layer.borderWidth = 1
        
        photoCell.imageView.image = UIImage(named: "\(Photo.data[indexPath.item].namePhoto)")
        photoCell.titleLabel.text = Photo.data[indexPath.item].titlePhoto
        
        return photoCell
    }
}

//MARK: - UICollectionViewDelegate
extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //переход assenbly
        if indexPath.item != nil {
            let detailVC = DetailViewController()
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let countItemsPerRow: CGFloat = 2
        let paddingWidth = Metrics.spacing * (countItemsPerRow + 1)
        let availableWidth = CGFloat(photosView?.photosCollectionView.bounds.width ?? 0) - paddingWidth
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
