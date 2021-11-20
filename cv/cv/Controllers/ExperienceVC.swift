//
//  ExperienceVC.swift
//  cv
//
//  Created by pavel on 18.11.21.
//

import UIKit

final class ExperienceVC {
    let experienceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Experience"
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        return label
    }()
    
    let firstJobPositionLabel = UILabel()
    let firstCompanyLabel = UILabel()
    let firstDateWorkLabel = UILabel()
    let presentJobPositionLabel = UILabel()
    let presentCompanyLabel = UILabel()
    let presentDateWorkLabel = UILabel()
    
    let firstCircleView = UIView()
    let secondCircleView = UIView()
    let lineView = UIView()
}
