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
    }
   
    
    //MARK: - setup tableView
    func setupListCarsTableView() {
        listCarsTableView.frame = view.bounds
        listCarsTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.id)
        listCarsTableView.delegate = self
        listCarsTableView.dataSource = self
        view.addSubview(listCarsTableView)
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
        
        //carCell.layoutSubviews()
        
        let nameCar = Cars.carsArray[indexPath.row].manufacturer + " " + Cars.carsArray[indexPath.row].model
        carCell.nameCarLabel.text = "Модель: " + nameCar //manufacturer + model
        
        let bodyCar = Cars.carsArray[indexPath.row].body.rawValue
        carCell.bodyLabel.text = "Тип кузова: " + bodyCar //body
        
        //delete optional + add "-" if empty !!!
        carCell.yearLabel.text = "Год выпуска: \(Cars.carsArray[indexPath.row].yearOfIssue)" //year
        
        return carCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }
    
}
