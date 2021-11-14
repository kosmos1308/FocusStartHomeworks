//
//  TabBarController.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .systemRed
        let cvVC = CVViewController()
        let skillsVC = SkillsViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        guard let cvImage = UIImage(systemName: "person.text.rectangle.fill", withConfiguration: boldConfig) else {return}
        guard let skillsImage = UIImage(systemName: "brain.head.profile", withConfiguration: boldConfig) else {return}
        
        viewControllers = [ generateNavigationController(rootViewControlller: cvVC, title: "CV", image: cvImage),
                            generateNavigationController(rootViewControlller: skillsVC, title: "Skills", image: skillsImage)
                            ]
        tabBar.backgroundColor = .systemGray

    }
    
    
    func generateNavigationController(rootViewControlller: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewControlller)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    


}
