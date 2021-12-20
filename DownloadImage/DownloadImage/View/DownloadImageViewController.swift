//
//  DownloadImageViewController.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

protocol IDownloadImageViewController: UIViewController {

    func showAlert(message: String)
}

final class DownloadImageViewController: UIViewController {
    
    private var downloadImageView: IDownloadImageView
    private var downloadImagePresenter: IDownloadImagePresenter
    
    struct Dependencies {
        let presenter: IDownloadImagePresenter
    }
      
    init(dependencies: Dependencies) {
        self.downloadImagePresenter = dependencies.presenter
        self.downloadImageView = DownloadImageView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.downloadImagePresenter.loadView(controller: self, view: self.downloadImageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.updateNavigationBar()
    }
    
    private func updateNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Download image"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.downloadImageView)
    }
}

extension DownloadImageViewController: IDownloadImageViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error! Not image ☹️", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
