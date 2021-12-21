//
//  DownloadImageView.swift
//  DownloadImage
//
//  Created by pavel on 20.12.21.
//

import UIKit

//MARK: - Protocol definition
protocol IDownloadImageView: UIView {
    var onTouchHandler: ((String) -> Void)?  { get set }
    var tableView: UITableView { get set }
    func showProgress(progress: Float)
    func getData(image: Data, name: String, size: String)
}

//MARK: - Class definition
final class DownloadImageView: UIView {
    
    private var controller: DownloadImageViewController?
    private var presenter: IDownloadImagePresenter?
    
    var onTouchHandler: ((String) -> Void)?
    private var images = [Data]()
    private var nameImages = [String]()
    private var sizeImages = [String]()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.0
        progressView.progressTintColor = .systemBlue
        return progressView
    }()

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        return searchBar
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DownloadImageTableViewCell.self,
                           forCellReuseIdentifier: DownloadImageTableViewCell.id)
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func configureView() {
        self.backgroundColor = .systemBackground

        self.addSubview(self.progressView)
        self.addSubview(self.tableView)
        self.addSubview(self.searchBar)
        
        self.configureSearchBar()
        self.configureTableView()
        self.setupAutoLayout()
    }
    
    private func configureSearchBar() {
        self.searchBar.delegate = self
    }

    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.progressView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.progressView.bottomAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading/2),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing/2)
        ])
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

//MARK: - UISearchBarDelegate
extension DownloadImageView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        self.onTouchHandler?(text)
    }
}

//MARK: - UITableViewDataSource
extension DownloadImageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DownloadImageTableViewCell.id, for: indexPath)
        guard let imageCell = cell as? DownloadImageTableViewCell else { return UITableViewCell()}
        
        imageCell.pictureImageView.image = UIImage(data: images[indexPath.row])
        imageCell.nameImageLabel.text = nameImages[indexPath.row]
        imageCell.downloadMbLabel.text = sizeImages[indexPath.row]
        
        return imageCell
    }
}

//MARK: - UITableViewDelegate
extension DownloadImageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrics.heightCell
    }
}

//MARK: - IDownloadImageView
extension DownloadImageView: IDownloadImageView {
    func showProgress(progress: Float) {
        self.progressView.setProgress(progress, animated: true)
    }
    
    func getData(image: Data, name: String, size: String) {
        self.images.append(image)
        self.nameImages.append(name)
        self.sizeImages.append(size)
    }
}
