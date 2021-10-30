//
//  CarsViewController.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//

import UIKit

class CarsViewController: UIViewController {
    
    let nameCarPicker = UIPickerView()
    let bodyCarPicker = UIPickerView()
    let toolBar = UIToolbar()
    
    let manufacturerTextField = UITextField()
    let modelTextField = UITextField()
    let bodyTextField = UITextField()
    let yearTextField = UITextField()
    let carNumberTextField = UITextField()
    
    let addCarButton = UIButton()
    
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
        nameCarPicker.reloadComponent(0)
        nameCarPicker.reloadComponent(1)
        bodyCarPicker.reloadComponent(0)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cars"
        view.backgroundColor = .systemGray6
        
        setupTextFields()
        showAddCarButton()
        showPickers()
    }
    
    
    //MARK: - setup textFields
    func setupTextFields() {
        manufacturerTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20), y: Int(view.bounds.origin.y + 100), width: Int(view.bounds.width/2 - 20), height: 40)
        manufacturerTextField.placeholder = "Марка *"
        manufacturerTextField.inputView = nameCarPicker
        manufacturerTextField.inputAccessoryView = toolBar
        manufacturerTextField.borderStyle = .roundedRect
        view.addSubview(manufacturerTextField)
        
        modelTextField.frame = CGRect(x: Int(view.bounds.origin.x + manufacturerTextField.bounds.width + 30), y: Int(view.bounds.origin.y + 100), width: Int(view.bounds.width/2 - 30), height: 40)
        modelTextField.placeholder = "Модель *"
        modelTextField.inputView = nameCarPicker
        modelTextField.inputAccessoryView = toolBar
        modelTextField.borderStyle = .roundedRect
        view.addSubview(modelTextField)
        
        bodyTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20), y: Int(view.bounds.origin.y + 150), width: Int(view.bounds.width - 40), height: 40)
        bodyTextField.placeholder = "Тип кузова *"
        bodyTextField.inputView = bodyCarPicker
        bodyTextField.inputAccessoryView = toolBar
        bodyTextField.borderStyle = .roundedRect
        view.addSubview(bodyTextField)
        
        yearTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20), y: Int(view.bounds.origin.y + 200), width: Int(view.bounds.width - 40), height: 40)
        yearTextField.placeholder = "Год выпуска"
        yearTextField.borderStyle = .roundedRect
        view.addSubview(yearTextField)
        
        carNumberTextField.frame = CGRect(x: Int(view.bounds.origin.x + 20), y: Int(view.bounds.origin.y + 250), width: Int(view.bounds.width - 40), height: 40)
        carNumberTextField.placeholder = "Гос. номер"
        carNumberTextField.borderStyle = .roundedRect
        view.addSubview(carNumberTextField)
    }
    
    
    //MARK: - show button "Добавить авто" + action
    func showAddCarButton() {
        addCarButton.frame = CGRect(x: Int(view.bounds.origin.x + 20), y: Int(view.bounds.origin.y + 350), width: Int(view.bounds.width - 40), height: 40)
        addCarButton.backgroundColor = .systemGreen
        addCarButton.setTitleColor(.white, for: .normal)
        addCarButton.setTitle("Добавить авто", for: .normal)
        addCarButton.layer.cornerRadius = 5
        addCarButton.addTarget(self, action: #selector(tapAddCarButton), for: .touchUpInside)
        view.addSubview(addCarButton)
    }
    
    
    @objc func tapAddCarButton() {
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
        let car = Cars(manufacturer: manufacturerCar, model: modelCar, body: bodyCar, yearOfIssue: yearOfIssue, carNumber: carNumber)
        Cars.carsArray.append(car)
        
        //delete text in textField
        manufacturerTextField.text = ""
        modelTextField.text = ""
        bodyTextField.text = ""
        yearTextField.text = ""
        carNumberTextField.text = ""
    }
    
 
    //MARK: - show pickers + button "Done"
    func showPickers() {
        nameCarPicker.dataSource = self
        nameCarPicker.delegate = self
        nameCarPicker.tag = 0
        
        bodyCarPicker.dataSource = self
        bodyCarPicker.delegate = self
        bodyCarPicker.tag = 1

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tapDoneButton))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: true)
    }

    
    @objc func tapDoneButton() {
        manufacturerTextField.resignFirstResponder()
        modelTextField.resignFirstResponder()
        bodyTextField.resignFirstResponder()
    }
}


//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension CarsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
            
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var numberManufacturerRow: Int = 0
        numberManufacturerRow = nameCarPicker.selectedRow(inComponent: 0)
        
        if modelTextField.text == "" {
            numberManufacturerRow = 0
        }
        
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
        
        default:
            return ""
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        nameCarPicker.reloadComponent(0)
        nameCarPicker.reloadComponent(1)
        let numberRow = nameCarPicker.selectedRow(inComponent: 0)
        
        switch pickerView.tag {
        case 0:
            if component == 0 {
                manufacturerTextField.text = manufacturerArray[row]
            } else if component == 1 {
                modelTextField.text = modelsArray[numberRow][row]
            }
        case 1:
            let nameBody: Body = .allCases[row]
            bodyTextField.text = nameBody.rawValue
        default:
            break
        }
    }
    
}
