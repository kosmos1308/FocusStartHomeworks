//
//  PhotoViewController.swift
//  CollectionApp
//
//  Created by pavel on 18.11.21.
//

import UIKit

class PhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Photo"
        view.backgroundColor = .white
        
    }

    
    
}

