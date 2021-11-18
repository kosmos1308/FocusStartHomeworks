//
//  SkillVC.swift
//  cv
//
//  Created by pavel on 18.11.21.
//

import UIKit

class SkillVC: UIViewController {
    let skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        label.text = "Skills"
        return label
    }()
    let swiftSkillView = UIView()
    let gitSkillView = UIView()
    let englishSkillView = UIView()
    let swiftImageView = UIImageView()
    let gitImageView = UIImageView()
    let englishImageView = UIImageView()
    let swiftLabel = UILabel()
    let gitLabel = UILabel()
    let englishLabel = UILabel()
}
