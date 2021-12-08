//
//  ChooseViewController.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

final class ChooseViewController: UIViewController {
    
    private var chooseView: ChooseView?
    
    init() {
        self.chooseView = ChooseView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.chooseView?.loadView(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        updateNavBar()
        
        self.chooseView?.carsTableView.delegate = self
        self.chooseView?.carsTableView.dataSource = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.chooseView?.configureView()
        guard let chooseView = chooseView else {
            return
        }
        self.view.addSubview(chooseView)
    }
    
    
    private func updateNavBar() {
        let label = UILabel()
        label.text = "Выберите"
        label.font = UIFont(name: "Inter-SemiBold", size: 30)
        self.navigationItem.titleView = label
    }
    
}

//MARK: - UITableViewDataSource
extension ChooseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = chooseView?.carsTableView.dequeueReusableCell(withIdentifier: ChooseCarTableViewCell.id, for: indexPath)
        guard let carCell = cell as? ChooseCarTableViewCell else {return cell ?? UITableViewCell()}
        
        return carCell
    }
}

//MARK: - UITableViewDelegate
extension ChooseViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 43
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

