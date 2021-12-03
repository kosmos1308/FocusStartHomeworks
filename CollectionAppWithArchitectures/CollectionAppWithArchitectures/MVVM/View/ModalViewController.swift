//
//  ModalViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 30.11.21.
//

import UIKit

//MARK: - class definition
final class ModalViewController: UIViewController {
    
    var modalView: ModalView?
    var modalViewModel = ModalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let modalView = modalView else { return }
        view.addSubview(modalView)
        
        setHandlers()

        modalViewModel.data.setNotify { [weak self] text in
            self?.modalView?.descriptionTextView.text = text
        }
    }
    
    override func loadView() {
        super.loadView()
        modalView = ModalView(frame: UIScreen.main.bounds)
        modalView?.loadView(controller: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modalView?.configureView()
    }
}

//MARK: - private extension
private extension ModalViewController {
    private func onTouched() {
        dismiss(animated: true, completion: nil)
    }

    private func setHandlers() {
        self.modalView?.onTouchedHandler = { [weak self] in
            self?.onTouched()
        }
    }
}
