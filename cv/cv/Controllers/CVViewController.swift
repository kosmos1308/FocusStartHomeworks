//
//  CVViewController.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

class CVViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let moreButton = UIButton()
    let messageButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "About me"
        
        scrollView.bounds = view.bounds
        view.addSubview(scrollView)
        
        updateNavBar()
        
    }
    
    
    func updateNavBar() {
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "circle.righthalf.fill"),
                                                              style: .done,
                                                              target: self,
                                                              action: #selector(tapThemesButton)),
                                              UIBarButtonItem(image: UIImage(systemName: "message"),
                                                              style: .done,
                                                              target: self,
                                                              action: #selector(tapMessageButton))
                                          ]
    }
    
    
    @objc func tapMessageButton() {
        print("message")
    }
    
    
    @objc func tapThemesButton() {
        print("themes")
    }
    

}
