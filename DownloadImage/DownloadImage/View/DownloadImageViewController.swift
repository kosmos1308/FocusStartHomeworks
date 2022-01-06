//
//  DownloadImageViewController.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

//MARK: - Protocol definition
protocol IDownloadImageViewController: UIViewController {
    func showAlert(message: String)
    func showProgressText(progress: String)
}

//MARK: - Class definition
final class DownloadImageViewController: UIViewController {
    
    private let loadingLabel = UILabel()
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
                
        let rect: CGRect = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 200, height: 40))
        self.loadingLabel.frame = rect
        self.loadingLabel.textAlignment = .center

        let titleView = UIView()
        titleView.frame = rect
        titleView.addSubview(self.loadingLabel)
        navigationItem.titleView = titleView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.downloadImageView)
    }
}

//MARK: - IDownloadImageViewController
extension DownloadImageViewController: IDownloadImageViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error! Not image ☹️", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func showProgressText(progress: String) {
        self.loadingLabel.text = progress
    }
}
