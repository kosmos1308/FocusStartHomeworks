//
//  ChooseViewController.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import UIKit

//MARK: - Protocol definition
protocol IChooseViewController: UIViewController {
    func setCars(modelsCars: [Car])
    var onTouchedHandler: ((Int) -> Void)? { get set }
}


//MARK: - Class definition
final class ChooseViewController: UIViewController {
    
    private var cars = [Car]()
    private var chooseView: IChooseView
    private var choosePresenter: IChoosePresenter
    
    var onTouchedHandler: ((Int) -> Void)?
    
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
        self.updateNavBar()
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
        return self.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chooseView.carsTableView.dequeueReusableCell(withIdentifier: ChooseCarTableViewCell.id, for: indexPath)
        guard let carCell = cell as? ChooseCarTableViewCell else {return cell}
        carCell.modelCarLabel.text = "\(self.cars[indexPath.row].modelCar)"
        
        return carCell
    }
}

//MARK: - UITableViewDelegate
extension ChooseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrics.heigtModelCarCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.onTouchedHandler?(indexPath.row)
    }
}

