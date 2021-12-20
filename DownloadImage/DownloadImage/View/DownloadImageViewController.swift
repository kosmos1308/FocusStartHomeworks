//
//  DownloadImageViewController.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

class DownloadImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.updateNavigationBar()
    }
    
    func updateNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Download image"
    }

}
