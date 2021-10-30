//
//  CarsViewController.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//

import UIKit

class CarsViewController: UIViewController {
    
    let nameCarPicker = UIPickerView()
    let bodyPicker = UIPickerView()
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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cars"
        view.backgroundColor = .systemBackground
        
    }
    
    

   

}
