//
//  MainTabBarController.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carsVC = CarsViewController()
        let listVC = ListViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        guard let carsImage = UIImage(systemName: "car.2", withConfiguration: boldConfig) else {return}
        guard let listImage = UIImage(systemName: "list.bullet", withConfiguration: boldConfig) else {return}
        
        tabBar.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        viewControllers = [
            generateNavigationController(rootViewController: carsVC, title: "Авто", image: carsImage),
            generateNavigationController(rootViewController: listVC, title: "Мой гараж", image: listImage)
        ]
    }
    
    
    func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
}
