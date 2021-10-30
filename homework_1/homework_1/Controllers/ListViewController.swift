//
//  ListViewController.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//

import UIKit

class ListViewController: UIViewController {
    
    let listCarsTableView = UITableView()
    let filterView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listCarsTableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Мой гараж"
        view.backgroundColor = .systemBackground
        
        setupListCarsTableView()
        addFilterButton()
                
    }
    
    //MARK: - add button "Filter" navigationItem + action
    func addFilterButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filtr"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(tapFilterButton))
    }
    
    
    @objc func tapFilterButton() {
        showFilterView()
    }
   
    
    //MARK: - setup tableView
    func setupListCarsTableView() {
        listCarsTableView.frame = view.bounds
        listCarsTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.id)
        listCarsTableView.delegate = self
        listCarsTableView.dataSource = self
        view.addSubview(listCarsTableView)
    }
    
    
    //MARK: - showFilterView
    func showFilterView() {
        filterView.frame = CGRect(x: Int(view.bounds.origin.x + 30),
                                  y: Int(view.bounds.origin.y + 120),
                                  width: Int(view.bounds.width - 60),
                                  height: Int(view.bounds.height - 240))
        filterView.backgroundColor = .systemGray6
        filterView.layer.cornerRadius = 15
        filterView.isHidden = false
        view.addSubview(filterView)
        
        addButtonsFilterView()
        addLabelsFilterView()
        addSwitchsFilterView()
    }
    
    
    //MARK: - add "close", "Применить фильтр" buttons + actions
    func addButtonsFilterView() {
        let closeButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: Int(filterView.bounds.width - 40),
                                  y: Int(filterView.bounds.origin.y + 10),
                                  width: 30,
                                  height: 30)
            button.layer.cornerRadius = 15
            button.setImage(UIImage(named: "close"), for: .normal)
            button.addTarget(self, action: #selector(tapCloseButtonInFilterView),
                             for: .touchUpInside)
            return button
        }()
        
        let addFilterBodyButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: Int(filterView.bounds.origin.x + 30),
                                  y: Int(filterView.bounds.height - 100),
                                  width: Int(filterView.bounds.width - 60),
                                  height: 40)
            button.backgroundColor = .systemGreen
            button.layer.cornerRadius = 5
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Применить фильтр", for: .normal)
            button.addTarget(self, action: #selector(tapAddFilterBodyButton),
                             for: .touchUpInside)
            return button
        }()
        
        filterView.addSubview(closeButton)
        filterView.addSubview(addFilterBodyButton)
    }
    
    
    @objc func tapCloseButtonInFilterView() {
        filterView.frame.origin.x += view.bounds.width + 40
    }
    
    
    @objc func tapAddFilterBodyButton() {
        print("Применить фильтр")
    }
    
    
    //MARK: - add "Выберете тип кузова", "Седан", "Хэтчбек", "Купе" labels on filterView
    func addLabelsFilterView() {
        let informLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: Int(filterView.bounds.origin.x + 40),
                                 y: Int(filterView.bounds.origin.y + 20),
                                 width: Int(filterView.bounds.width - 80),
                                 height: 30)
            label.font = UIFont(name: "Arial Bold", size: 23)
            label.text = "Выберете тип кузова"
            label.textAlignment = .center
            return label
        }()
        
        let sedanLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: Int(filterView.bounds.origin.x + 20),
                                 y: Int(filterView.bounds.origin.y + 80),
                                 width: Int(filterView.bounds.width - 140),
                                 height: 30)
            label.font = UIFont(name: "Arial", size: 20)
            label.text = "Седан"
            return label
        }()
        
        let hatchbackLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: Int(filterView.bounds.origin.x + 20),
                                 y: Int(filterView.bounds.origin.y + 120),
                                 width: Int(filterView.bounds.width - 140),
                                 height: 30)
            label.font = UIFont(name: "Arial", size: 20)
            label.text = "Хэтчбек"
            return label
        }()
        
        let coupeLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: Int(filterView.bounds.origin.x + 20),
                                 y: Int(filterView.bounds.origin.y + 160),
                                 width: Int(filterView.bounds.width - 140),
                                 height: 30)
            label.font = UIFont(name: "Arial", size: 20)
            label.text = "Купе"
            return label
        }()
        
        filterView.addSubview(informLabel)
        filterView.addSubview(sedanLabel)
        filterView.addSubview(hatchbackLabel)
        filterView.addSubview(coupeLabel)
    }
    
    
    //MARK: - add switchs on filterView
    func addSwitchsFilterView() {
        let sedanSwitch = UISwitch()
        sedanSwitch.tag = 0
        sedanSwitch.frame = CGRect(x: Int(filterView.bounds.width - 80), y: Int(filterView.bounds.origin.y + 80), width: 0, height: 0)
        sedanSwitch.isOn = false
        sedanSwitch.addTarget(self, action: #selector(valueChangeSwitch(sender:)),
                              for: .valueChanged)
        
        let hatchbackSwitch = UISwitch()
        hatchbackSwitch.tag = 1
        hatchbackSwitch.frame = CGRect(x: Int(filterView.bounds.width - 80), y: Int(filterView.bounds.origin.y + 120), width: 0, height: 0)
        hatchbackSwitch.isOn = false
        hatchbackSwitch.addTarget(self, action: #selector(valueChangeSwitch(sender:)),
                                  for: .valueChanged)
        
        let coupeSwitch = UISwitch()
        coupeSwitch.tag = 2
        coupeSwitch.frame = CGRect(x: Int(filterView.bounds.width - 80), y: Int(filterView.bounds.origin.y + 160), width: 0, height: 0)
        coupeSwitch.isOn = false
        coupeSwitch.addTarget(self, action: #selector(valueChangeSwitch(sender:)),
                              for: .valueChanged)
        
        filterView.addSubview(sedanSwitch)
        filterView.addSubview(hatchbackSwitch)
        filterView.addSubview(coupeSwitch)
        
    }
    
    
    @objc func valueChangeSwitch(sender: UISwitch) {
        
    }
   
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Cars.carsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let carCell = listCarsTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as! ListTableViewCell
        
        //background cell
        if indexPath.row % 2 == 0 {
            carCell.backgroundColor = .systemGray6
        } else {
            carCell.backgroundColor = .white
        }
        
        //manufacturer + model
        let nameCar = Cars.carsArray[indexPath.row].manufacturer + " " + Cars.carsArray[indexPath.row].model
        carCell.nameCarLabel.text = "Модель: " + nameCar
        
        //body
        let bodyCar = Cars.carsArray[indexPath.row].body.rawValue
        carCell.bodyLabel.text = "Тип кузова: " + bodyCar
        
        //year

        let yearCar = Cars.carsArray[indexPath.row].yearOfIssue ?? 0
        
        if Cars.carsArray[indexPath.row].yearOfIssue == nil {
            carCell.yearLabel.text = "Год выпуска: - "
        } else {
            carCell.yearLabel.text = "Год выпуска: \(yearCar)"
        }
        
        return carCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }
    
}
