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
        
        photosView = PhotosView(frame: view.bounds)
        photosView?.loadView(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let photosView = photosView else {
            return
        }
        view.addSubview(photosView)
        
        //navigationBar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Photos"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        photosView?.configureView()
    }
    
    
}

