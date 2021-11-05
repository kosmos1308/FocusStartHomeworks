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
    var listBodyCarsArray = [Car]()
    let bodyFilterPicker = UIPickerView()
    let garage = Garage.shared
    var numberBodyPicker: Int?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listCarsTableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Мой гараж"
        view.backgroundColor = .systemGray6
        
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
        addLabelFilterView()
        addPickerFilterView()
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
    
    
    //MARK: - add "Выберете тип кузова" label
    func addLabelFilterView() {
        let informLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: Int(filterView.bounds.origin.x + 40),
                                 y: Int(filterView.bounds.origin.y + 20),
                                 width: Int(filterView.bounds.width - 80),
                                 height: 50)
            label.font = UIFont(name: "Arial Bold", size: 22)
            label.text = "Выберете тип кузова"
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        filterView.addSubview(informLabel)
    }
    
    
    //MARK: - add
    func addPickerFilterView() {
        bodyFilterPicker.frame = CGRect(x: filterView.bounds.origin.x + 20,
                                        y: filterView.bounds.height/2 - 75,
                                        width: filterView.bounds.width - 40,
                                        height: 150)
        bodyFilterPicker.delegate = self
        bodyFilterPicker.dataSource = self
        filterView.addSubview(bodyFilterPicker)
    }
    
    
    //MARK: - get type body car
    func getTypeBodyCar(list typeBody: [Car]) {
        let typeBodyCars = typeBody
        listBodyCarsArray = typeBodyCars
    }
    
    
    //MARK: - return all list car
    func allListCars() -> [Car] {
        var allListCar: [Car] = []
        for list in garage.carsArray {
            allListCar.append(list)
        }
        return allListCar
    }
    
    
    //MARK: - return list sedan, hatchback, coupe cars
    func filterCar() -> [Car] {
        let allList = allListCars()
        var filterArray: [Car] = []
        var _ = allList.filter { result in
            if result.body == Body.sedan && numberBodyPicker == 0 {
                filterArray.append(result)
            } else if result.body == Body.hatchback && numberBodyPicker == 1 {
                filterArray.append(result)
            } else if result.body == Body.coupe && numberBodyPicker == 2 {
                filterArray.append(result)
            }
            return true
        }
        return filterArray
    }
}


//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberBodyPicker != nil {
            return listBodyCarsArray.count
        } else {
            return garage.carsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listCarsTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath)
    
        guard let carCell = cell as? ListTableViewCell else {
            return cell
        }
        
        //text cell
        if listBodyCarsArray.isEmpty == false {
            let nameCar = listBodyCarsArray[indexPath.row].manufacturer + " " + listBodyCarsArray[indexPath.row].model
            carCell.nameCarLabel.text = "Модель: " + nameCar
            
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
            let nameCar = garage.carsArray[indexPath.row].manufacturer + " " + garage.carsArray[indexPath.row].model
            carCell.nameCarLabel.text = "Модель: " + nameCar
            
            //body
            let bodyCar = garage.carsArray[indexPath.row].body.rawValue
            carCell.bodyLabel.text = "Тип кузова: " + bodyCar
            
            //year
            let yearCar = garage.carsArray[indexPath.row].yearOfIssue ?? 0
            if garage.carsArray[indexPath.row].yearOfIssue == nil {
                carCell.yearLabel.text = "Год выпуска: - "
            } else {
                carCell.yearLabel.text = "Год выпуска: \(yearCar)"
            }
        }
        return carCell
    }
}


//MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }
}


//MARK: - UIPickerViewDataSource
extension ListViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Body.allCases.count
    }
}


//MARK: - UIPickerViewDelegate
extension ListViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return Body.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var typeBody: [Car] = []
        numberBodyPicker = row
        
        switch row {
        case 0:
            typeBody = filterCar()
        case 1:
            typeBody = filterCar()
        case 2:
            typeBody = filterCar()
        default:
            break
        }
        getTypeBodyCar(list: typeBody)
    }
}

