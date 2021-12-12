//
//  ChooseViewController.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

protocol IChooseViewController: AnyObject {
    func setCars(modelsCars: [Car])
    //func setContentTitle(title: PresentContent)
    var onTouchedHandler: ((String) -> Void)? { get set }
}

final class ChooseViewController: UIViewController {
    
    private var cars = [Car]()
    private var index: Int?
    private var chooseView: IChooseView
    private var choosePresenter: IChoosePresenter
    
    var onTouchedHandler: ((String) -> Void)?

    
    struct Dependencies {
        let presenter: IChoosePresenter
    }
    
    init(dependencies: Dependencies) {
        self.chooseView = ChooseView(frame: UIScreen.main.bounds)
        self.choosePresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.choosePresenter.loadView(controller: self, view: self.chooseView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavBar()
        self.chooseView.carsTableView.delegate = self
        self.chooseView.carsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(chooseView)
    }
    
    private func updateNavBar() {
        self.navigationItem.titleView = chooseView.titleLabel
    }
}

//MARK: - IChooseViewController
extension ChooseViewController: IChooseViewController {
    func setCars(modelsCars: [Car]) {
        self.cars = modelsCars
    }
}

//MARK: - UITableViewDataSource
extension ChooseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = chooseView.carsTableView.dequeueReusableCell(withIdentifier: ChooseCarTableViewCell.id, for: indexPath)
        guard let carCell = cell as? ChooseCarTableViewCell else {return cell}
        carCell.modelCarLabel.text = "\(cars[indexPath.row].modelCar)"
        
        return carCell
    }
}

//MARK: - UITableViewDelegate
extension ChooseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let modelCar = self.cars[indexPath.row].modelCar
        self.chooseView.onTouchedHandler?(modelCar)
    }
}
