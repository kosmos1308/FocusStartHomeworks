//
//  PhotoViewController.swift
//  CollectionApp
//
//  Created by pavel on 18.11.21.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        updateNavController()
        setupCollectionView()
    }
    
    
    //MARK: - update navigationController
    private func updateNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Photo"
    }
    
    //MARK: - setup collectionView
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width/2 - Metrics.left, height: view.bounds.width/2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {return}
        collectionView.register(PhotoCollectionViewCell.self,
                                forCellWithReuseIdentifier: PhotoCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        setupCollectionViewAutoLayout()
    }
    
    
    //MARK: - setup autoLayout collectionView
    private func setupCollectionViewAutoLayout() {
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


//MARK: - UICollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Photo.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.id, for: indexPath)
        guard let photoCell = cell as? PhotoCollectionViewCell else {return cell}
        photoCell.photoImageView.image = UIImage(named: "\(Photo.data[indexPath.item].namePhoto)")
        photoCell.namePhotoLabel.text = Photo.data[indexPath.item].titlePhoto
        
        return photoCell
    }
}

//MARK: - UICollectionViewDelegate
extension PhotoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.text = Photo.data[indexPath.item].titlePhoto
        detailVC.nameImage = Photo.data[indexPath.item].namePhoto
        detailVC.descriptionText = Photo.data[indexPath.item].descriptionPhoto
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: Metrics.top/2, left: 13, bottom: Metrics.bottom, right: 13)
    }
}

