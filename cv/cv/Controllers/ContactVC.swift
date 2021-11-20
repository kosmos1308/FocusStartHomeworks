//
//  ContactVC.swift
//  cv
//
//  Created by pavel on 18.11.21.
//

import UIKit

final class ContactVC: UIViewController {
    
    let contactsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contacts"
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        return label
    }()
    
    let phoneLabel = UILabel()
    let emailLabel = UILabel()
    let telegramLabel = UILabel()
}
