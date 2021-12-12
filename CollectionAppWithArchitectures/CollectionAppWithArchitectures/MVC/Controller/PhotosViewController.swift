//
//  PhotosViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 27.11.21.
//

import UIKit

//MARK: - class definition
final class PhotosViewController: UIViewController {
    
    private var photosView: PhotosView?
    private var photos: Photos?
    
    init() {
        self.photosView = PhotosView(frame: UIScreen.main.bounds)
        self.photos = Photos()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.photosView?.loadView(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateNavigationBar()

        guard let photosView = self.photosView else { return }
        view.addSubview(photosView)
        
        photosView.photosCollectionView.delegate = self
        photosView.photosCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.photosView?.configureView()
    }
    
    private func updateNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Photos"
    }
    
    private func pushNextVC(photo: Photo) {
        let vc = AssamblyDetailVC.build(photo: photo)
        navigationController?.pushViewController(vc, animated: false)
    }
}

//MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = photos?.getPhoto().count ?? 0
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = photosView?.photosCollectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath)
        guard let photoCell = cell as? PhotosCollectionViewCell else {return cell ?? UICollectionViewCell()}
        photoCell.backgroundColor = .white
        photoCell.layer.cornerRadius = Metrics.cornerRadius
        photoCell.layer.borderColor = UIColor.black.cgColor
        photoCell.layer.borderWidth = 1
        
        let title = photos?.getPhoto()[indexPath.item].titlePhoto
        let namePhoto = photos?.getPhoto()[indexPath.item].namePhoto ?? ""
        photoCell.titleLabel.text = title
        photoCell.imageView.image = UIImage(named: namePhoto)
        
        return photoCell
    }
}

//MARK: - UICollectionViewDelegate
extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let detailPhoto = photos?.getPhoto()[indexPath.item] {
            pushNextVC(photo: detailPhoto)
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
