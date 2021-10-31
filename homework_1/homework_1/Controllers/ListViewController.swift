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
    
    var listBodyCarsArray = [Cars]()
    
    let sedanSwitch = UISwitch()
    let hatchbackSwitch = UISwitch()
    let coupeSwitch = UISwitch()
    
    
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
        showFilterView() //show filterView
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
        listCarsTableView.reloadData()
        filterView.frame.origin.x += view.bounds.width + 40
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
        sedanSwitch.tag = 0
        sedanSwitch.frame = CGRect(x: Int(filterView.bounds.width - 80), y: Int(filterView.bounds.origin.y + 80), width: 0, height: 0)
        //sedanSwitch.isOn = false
        sedanSwitch.addTarget(self, action: #selector(valueChangeSwitch(sender:)),
                              for: .valueChanged)
        
        hatchbackSwitch.tag = 1
        hatchbackSwitch.frame = CGRect(x: Int(filterView.bounds.width - 80),
                                     y: Int(filterView.bounds.origin.y + 120),
                                     width: 0,
                                     height: 0)
        hatchbackSwitch.addTarget(self, action: #selector(valueChangeSwitch(sender:)),
                                  for: .valueChanged)
        
        coupeSwitch.tag = 2
        coupeSwitch.frame = CGRect(x: Int(filterView.bounds.width - 80),
                                   y: Int(filterView.bounds.origin.y + 160),
                                   width: 0,
                                   height: 0)
        coupeSwitch.addTarget(self, action: #selector(valueChangeSwitch(sender:)),
                              for: .valueChanged)
        
        filterView.addSubview(sedanSwitch)
        filterView.addSubview(hatchbackSwitch)
        filterView.addSubview(coupeSwitch)
    }
    
    
    //MARK: - action switch
    @objc func valueChangeSwitch(sender: UISwitch) {
        var typeCarsArray: [Cars] = []
        
        switch sender.tag {
        case 0:
            if sender.isOn {
                typeCarsArray = filterSedanCar()
                hatchbackSwitch.isOn = false
                coupeSwitch.isOn = false
            } else {
                typeCarsArray.removeAll()
            }
            
        case 1:
            if sender.isOn {
                typeCarsArray = filterHatchbackCar()
                sedanSwitch.isOn = false
                coupeSwitch.isOn = false
            } else {
                
                typeCarsArray.removeAll()
            }
            
        case 2:
            if sender.isOn {
                typeCarsArray = filterCoupeCar()
                sedanSwitch.isOn = false
                hatchbackSwitch.isOn = false
            } else {
                typeCarsArray.removeAll()
            }
        default:
            break
        }
        getTypeBodyCar(list: typeCarsArray)
    }
    
    
    //MARK: - get type body car
    func getTypeBodyCar(list typeBody: [Cars]) {
        let typeBodyCars = typeBody
        listBodyCarsArray = typeBodyCars
        print(listBodyCarsArray)
    }
    
    
    //MARK: - return all list car
    func allListCars() -> [Cars] {
        var allListCar: [Cars] = []
        for list in Cars.carsArray {
            allListCar.append(list)
        }
        return allListCar
    }
    
    
    //MARK: - return list sedan, hatchback, coupe cars
    func filterSedanCar() -> [Cars] {
        let allList = allListCars()
        var sedanArray: [Cars] = []
        let _ = allList.filter { result in
            if result.body.rawValue.hasPrefix("С") {
                sedanArray.append(result)
            }
            return true
        }
        return sedanArray
    }

    
    func filterHatchbackCar() -> [Cars] {
        let allList = allListCars()
        var hatchbackArray: [Cars] = []
        let _ = allList.filter { result in
            if result.body.rawValue.hasPrefix("Х") {
                hatchbackArray.append(result)
            }
            return true
        }
        return hatchbackArray
    }
        
        
    func filterCoupeCar() -> [Cars] {
        let allList = allListCars()
        var coupeArray: [Cars] = []
        let _ = allList.filter { result in
            if result.body.rawValue.hasPrefix("К") {
                coupeArray.append(result)
            }
            return true
        }
        return coupeArray
    }
    
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if sedanSwitch.isOn == true || hatchbackSwitch.isOn == true || coupeSwitch.isOn == true {
            return listBodyCarsArray.count
        } else {
            return Cars.carsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let carCell = listCarsTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as! ListTableViewCell
        
        //background cell
        if indexPath.row % 2 == 0 {
            carCell.backgroundColor = .white
        } else {
            carCell.backgroundColor = .systemGray6
        }
        
        //text cell
        if listBodyCarsArray.isEmpty == false {
            let nameCar = listBodyCarsArray[indexPath.row].manufacturer + " " + listBodyCarsArray[indexPath.row].model
            carCell.nameCarLabel.text = "Модель:" + nameCar
            
            let bodyCar = listBodyCarsArray[indexPath.row].body.rawValue
            carCell.bodyLabel.text = "Тип кузова: " + bodyCar
            
            let yearCar = listBodyCarsArray[indexPath.row].yearOfIssue ?? 0
            if listBodyCarsArray[indexPath.row].yearOfIssue == nil {
                carCell.yearLabel.text = "Год выпуска: - "
            } else {
                carCell.yearLabel.text = "Год выпуска: \(yearCar)"
            }
            
        } else {
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
        }
        
        return carCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }
    
}
