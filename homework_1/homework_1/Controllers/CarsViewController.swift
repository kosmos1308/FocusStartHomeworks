//
//  CarsViewController.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//
//Функционал приложения
//Приложение должно обладать интерфейсом взаимодействия с пользователем
//(меню с возможностью выбора нужного варианта).
//
//Основные функции:
//1. Добавление нового автомобиля
//2. Вывод списка добавленных автомобилей
//3. Вывод списка автомобилей с использованием фильтра по типу кузова автомобиля

//Тип кузова
//Необходимо использовать enum с названием Body, в котором будут перечислены поддерживаемые приложением типы
//Отображение информации об автомобиле
//Отображение информации должно быть в формате:
//• <Поле>: <Значение>
//Для необязательных полей при отсутствии значения:
//• год выпуска – отображать «-»
//• гос номер – пропускать это поле (оно не должно отображаться)

import UIKit

class CarsViewController: UIViewController {
    
    let nameCarPicker = UIPickerView()
    let bodyCarPicker = UIPickerView()
    let yearCarPicker = UIPickerView()
    let toolBar = UIToolbar()
    
    let manufacturerTextField = UITextField()
    let modelTextField = UITextField()
    let bodyTextField = UITextField()
    let yearTextField = UITextField()
    let carNumberTextField = UITextField()
    
    let addCarButton = UIButton()
    let informAddCarLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Вы добавили автомобиль в гараж"
        label.textColor = .systemGreen
        return label
    }()
    
    let garage = Garage.shared
    let manufacturerArray = ["Audi",
                             "BMW",
                             "Ford",
                             "Opel",
                             "Mersedes",
                             "Mazda",
                             "Lexus",
                             "Toyota",
                             "Nissan",
                             "Volvo"]
    let modelsArray = [["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "Q3", "Q5", "Q7"],
                       ["3", "5", "7", "X3", "X5", "X6"],
                       ["Escort", "Fiesta", "Focus", "Fusion", "Mustang"],
                       ["Astra", "Corsa", "Insignia", "Kadet", "Vectra", "Zafira"],
                       ["A-класс", "B-класс", "C-класс", "E-класс", "G-класс", "M-класс", "R-класс", "S-класс"],
                       ["3", "6", "CX-3", "CX-5", "CX-7", "CX-9"],
                       ["IS", "LS", "LX", "NX", "RC", "RX", "SC", "UX"],
                       ["Camry", "Corolla", "Land Cruiser", "Prius", "RAV4", "Yaris"],
                       ["350Z", "Almera", "GT-R", "Juke", "Leaf", "Murano", "Teana"],
                       ["S40", "S60", "S80", "S90", "XC60", "XC70", "XC90"]]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadComponentsInPikcers()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Авто"
        view.backgroundColor = .systemGray6
        
        setupTextFields()
        showAddCarButton()
        showPickers()
    }
    
    
    //MARK: - setup textFields
    func setupTextFields() {
        manufacturerTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                             y: Int(view.bounds.origin.y + 100),
                                             width: Int(view.bounds.width/2 - 20),
                                             height: 40)
        manufacturerTextField.placeholder = "Марка *"
        manufacturerTextField.borderStyle = .none
        manufacturerTextField.isEnabled = false
        view.addSubview(manufacturerTextField)
        
        modelTextField.frame = CGRect(x: Int(view.bounds.origin.x
                                      + manufacturerTextField.bounds.width + 30),
                                      y: Int(view.bounds.origin.y + 100),
                                      width: Int(view.bounds.width/2 - 30),
                                      height: 40)
        modelTextField.placeholder = "Модель *"
        modelTextField.borderStyle = .none
        modelTextField.isEnabled = false
        view.addSubview(modelTextField)
        
        bodyTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                     y: Int(view.bounds.origin.y + 150),
                                     width: Int(view.bounds.width/2 - 20),
                                     height: 40)
        bodyTextField.placeholder = "Тип кузова *"
        bodyTextField.borderStyle = .none
        bodyTextField.isEnabled = false
        view.addSubview(bodyTextField)

        yearTextField.frame = CGRect(x: Int((view.bounds.origin.x
                                     + bodyTextField.bounds.width + 30)),
                                     y: Int(view.bounds.origin.y + 150),
                                     width: Int(view.bounds.width/2 - 30),
                                     height: 40)
        yearTextField.placeholder = "Год выпуска"
        yearTextField.borderStyle = .none
        view.addSubview(yearTextField)
        
        carNumberTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                          y: Int(view.bounds.origin.y + 200),
                                          width: Int(view.bounds.width - 40),
                                          height: 40)
        carNumberTextField.placeholder = "Гос. номер"
        carNumberTextField.borderStyle = .roundedRect
        carNumberTextField.delegate = self
        view.addSubview(carNumberTextField)
    }
    
    
    //MARK: - show label "Вы добавили автомобиль в гараж"
    func showAddCarInfoLabel() {
        informAddCarLabel.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                        y: Int(view.bounds.origin.y + 420),
                                        width: Int(view.bounds.width - 40),
                                        height: 20)
        informAddCarLabel.alpha = 1
        view.addSubview(informAddCarLabel)
    }
    
    
    //MARK: - show button "Добавить авто" + action
    func showAddCarButton() {
        addCarButton.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                    y: Int(view.bounds.origin.y + 450),
                                    width: Int(view.bounds.width - 40),
                                    height: 40)
        addCarButton.backgroundColor = .systemGreen
        addCarButton.setTitleColor(.white, for: .normal)
        addCarButton.setTitle("Добавить авто", for: .normal)
        addCarButton.layer.cornerRadius = 5
        addCarButton.addTarget(self, action: #selector(tapAddCarButton),
                               for: .touchUpInside)
        view.addSubview(addCarButton)
    }
    
    
    @objc func tapAddCarButton() {
        if (manufacturerTextField.text?.isEmpty) == true ||
            (modelTextField.text?.isEmpty) == true ||
            (bodyTextField.text?.isEmpty) == true {
            showAlert()
        } else {
            //manufacturer and model car
            guard let manufacturerCar = manufacturerTextField.text else {return}
            guard let modelCar = modelTextField.text else {return}
            
            //body
            let selectedBodyCar = bodyCarPicker.selectedRow(inComponent: 0)
            let bodyCar: Body = .allCases[selectedBodyCar]
            
            //year
            guard let yearCar = yearTextField.text else {return}
            let yearOfIssue = Int(yearCar)
            
            //number car
            guard let carNumber = carNumberTextField.text else {return}

            //create new car
            let car = Car(manufacturer: manufacturerCar,
                           model: modelCar, body: bodyCar,
                           yearOfIssue: yearOfIssue,
                           carNumber: carNumber)
            garage.carsArray.append(car) //add car in array
            deleteTextInTextFields() //delete text in textField
            reloadComponentsInPikcers() //update picker component
            showAddCarInfoLabel() //show label

            //animate label
            if informAddCarLabel.alpha == 1 {
                UIView.animate(withDuration: 3) {
                    self.informAddCarLabel.alpha = 0
                }
            }
        }
    }
    
    
    //MARK: - reload component in pickers
    func reloadComponentsInPikcers() {
        nameCarPicker.reloadComponent(0)
        nameCarPicker.reloadComponent(1)
        bodyCarPicker.reloadComponent(0)
    }
    
    
    //MARK: - show alert
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка!",
                                      message: "Заполните обязательные поля",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { action in
            if self.manufacturerTextField.text != "" {
                self.manufacturerTextField.text = ""
            }
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - delete text in textFields
    func deleteTextInTextFields() {
        manufacturerTextField.text = ""
        modelTextField.text = ""
        bodyTextField.text = ""
        yearTextField.text = ""
        carNumberTextField.text = ""
    }
    
 
    //MARK: - show pickers + button "Done" action
    func showPickers() {
        nameCarPicker.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                     y: Int(view.bounds.origin.y + 230),
                                     width: Int(view.bounds.width - 40),
                                     height: 100)
        nameCarPicker.dataSource = self
        nameCarPicker.delegate = self
        nameCarPicker.tag = 0
        view.addSubview(nameCarPicker)
        
        bodyCarPicker.frame = CGRect(x: Int(view.bounds.origin.x + 20),
                                     y: Int(view.bounds.origin.y + 320),
                                     width: Int(view.bounds.width/2 - 20),
                                     height: 100)
        bodyCarPicker.dataSource = self
        bodyCarPicker.delegate = self
        bodyCarPicker.tag = 1
        view.addSubview(bodyCarPicker)
        
        yearCarPicker.frame = CGRect(x: Int(view.bounds.width/2 + 20),
                                     y: Int(view.bounds.origin.y + 320),
                                     width: Int(view.bounds.width/2 - 20),
                                     height: 100)
        yearCarPicker.dataSource = self
        yearCarPicker.delegate = self
        yearCarPicker.tag = 2
        view.addSubview(yearCarPicker)
    }

}


//MARK: - UIPickerViewDataSource
extension CarsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: //manufacturer and model
            if component == 0 {
                return manufacturerArray.count
            }
            if component == 1 {
                return modelsArray[nameCarPicker.selectedRow(inComponent: 0)].count
            }
            return 0
            
        case 1: //body
            return Body.allCases.count //кол-во enum case
        case 2:
            return 102
            
        default:
            return 1
        }
    }
}


//MARK: - UIPickerViewDelegate
extension CarsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        var numberManufacturerRow: Int = 0
        numberManufacturerRow = nameCarPicker.selectedRow(inComponent: 0)
        
        switch pickerView.tag {
        case 0:
            if component == 0 {
                return manufacturerArray[row]
            }
            if component == 1 {
                return modelsArray[numberManufacturerRow][row]
            }
            return ""
            
        case 1:
            return Body.allCases[row].rawValue
            
        case 2:
            let currentYear = 2021
            return "\(currentYear - row)"
        
        default:
            return ""
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let numberRow = nameCarPicker.selectedRow(inComponent: 0)
        reloadComponentsInPikcers()
        
        switch pickerView.tag {
        case 0:
            if component == 0 {
                manufacturerTextField.text = manufacturerArray[row]
                if manufacturerTextField.text != "" {
                    modelTextField.text = ""
                 }
            } else if component == 1 {
                modelTextField.text = modelsArray[numberRow][row]
            }
        case 1:
            let nameBody: Body = .allCases[row]
            bodyTextField.text = nameBody.rawValue
        case 2:
            let selectedRow = yearCarPicker.selectedRow(inComponent: 0)
            let currentYear = 2021
            let yearCar = currentYear - selectedRow
            yearTextField.text = "\(yearCar)"
        default:
            break
        }
    }
}


//MARK: - UITextFieldDelegate
extension CarsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}


