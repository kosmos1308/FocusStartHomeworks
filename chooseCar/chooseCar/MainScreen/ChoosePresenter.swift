//
//  ChoosePresenter.swift
//  chooseCar
//
//  Created by pavel on 8.12.21.
//

import Foundation

final class ChoosePresenter {
    
    //model
    private weak var chooseVC: ChooseViewController?
    private weak var chooseView: ChooseView? 
    
    init() {
        
    }
    
    func loadView(controller: ChooseViewController, view: ChooseView) {
        self.chooseVC = controller
        self.chooseView = view
        self.chooseView?.setPresenter(presenter: self)
    }
}
