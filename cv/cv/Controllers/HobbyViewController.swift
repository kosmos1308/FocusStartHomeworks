//
//  HobbyViewController.swift
//  cv
//
//  Created by pavel on 14.11.21.
//

import UIKit

final class HobbyViewController: UIViewController {
    
    private let footballHobbyView = UIView()
    private let tennisHobbyView = UIView()
    private let programmingHobbyView = UIView()
    
    private let footballImageView = UIImageView()
    private let tennisImageView = UIImageView()
    private let programmingImageView = UIImageView()
    
    private let footballLabel = UILabel()
    private let tennisLabel = UILabel()
    private let codingLabel = UILabel()

    private let hobbyTitleArray = ["Football", "Table tennis", "Coding"]
    private let hobbyImageArray = ["football", "tennis", "coding"]
    
    private var hobbyViewArray = [UIView]()
    private var hobbyImgViewArray = [UIImageView]()
    private var hobbyLabelsArray = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Hobby"
        
        addHobbyView(hobbyView: footballHobbyView)
        addHobbyView(hobbyView: tennisHobbyView)
        addHobbyView(hobbyView: programmingHobbyView)
        
        addHobbyImageView(hobbyImageView: footballImageView)
        addHobbyImageView(hobbyImageView: tennisImageView)
        addHobbyImageView(hobbyImageView: programmingImageView)
        
        setupViewsAutoLayout()
        setupImageViewsAutoLayout()
        setupHobbyLabelsAutoLayout()
    }

    
    private func addHobbyView(hobbyView: UIView) {
        hobbyView.translatesAutoresizingMaskIntoConstraints = false
        hobbyView.layer.cornerRadius = 10
        hobbyView.layer.shadowColor = UIColor.black.cgColor
        hobbyView.layer.shadowOpacity = 1
        view.addSubview(hobbyView)
    }
    
    
    private func addHobbyImageView(hobbyImageView: UIImageView) {
        hobbyImageView.translatesAutoresizingMaskIntoConstraints = false
        hobbyImageView.backgroundColor = .systemGray6
        hobbyImageView.layer.shadowColor = UIColor.black.cgColor
        hobbyImageView.layer.shadowOpacity = 1
        hobbyImageView.layer.cornerRadius = 40
        hobbyImageView.contentMode = .scaleAspectFit
        view.addSubview(hobbyImageView)
    }
    
    
    private func setupViewsAutoLayout() {
        hobbyViewArray = [footballHobbyView, tennisHobbyView, programmingHobbyView]
        var index = -1
        var constant: CGFloat = 0
        for hobby in hobbyViewArray {
            index += 1
            constant += 150
        
            hobby.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Metrics.left).isActive = true
            hobby.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(Metrics.left * 3)).isActive = true
            hobby.heightAnchor.constraint(equalToConstant: Metrics.width + (Metrics.left * 2)).isActive = true
           
            switch index {
            case 0:
                hobby.backgroundColor = #colorLiteral(red: 0.4320183992, green: 0.883625567, blue: 0.9349003434, alpha: 1)
                hobby.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
            case 1:
                hobby.backgroundColor = #colorLiteral(red: 0.8574097157, green: 0.2946243882, blue: 0.2486538291, alpha: 1)
                hobby.topAnchor.constraint(equalTo: hobbyViewArray[0].bottomAnchor, constant: Metrics.left).isActive = true
            case 2:
                hobby.backgroundColor = #colorLiteral(red: 0.01008087303, green: 0.9371960759, blue: 0.8205029368, alpha: 1)
                hobby.topAnchor.constraint(equalTo: hobbyViewArray[1].bottomAnchor, constant: Metrics.left).isActive = true
            default:
                break
            }
        }
    }
    
    
    private func setupHobbyLabelsAutoLayout() {
        hobbyLabelsArray = [footballLabel, tennisLabel, codingLabel]
        var index = -1
        for label in hobbyLabelsArray {
            index += 1
            hobbyLabelsArray[index].textColor = .systemGray
            hobbyLabelsArray[index].font = UIFont(name: "Avenir Heavy", size: 30)
            hobbyLabelsArray[index].textAlignment = .center
            hobbyLabelsArray[index].translatesAutoresizingMaskIntoConstraints = false
            hobbyLabelsArray[index].text = hobbyTitleArray[index]
            hobbyViewArray[index].addSubview(hobbyLabelsArray[index])

            label.centerXAnchor.constraint(equalTo: hobbyViewArray[index].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: hobbyViewArray[index].centerYAnchor).isActive = true
            label.widthAnchor.constraint(equalToConstant: Metrics.width * 2).isActive = true
            label.heightAnchor.constraint(equalToConstant: Metrics.width/2).isActive = true
        }
    }
    

    private func setupImageViewsAutoLayout() {
        hobbyImgViewArray = [footballImageView, tennisImageView, programmingImageView]
        var index = -1
        for imgView in hobbyImgViewArray {
            index += 1
            imgView.image = UIImage(named: hobbyImageArray[index])
            view.addSubview(hobbyImgViewArray[index])
            
            imgView.centerXAnchor.constraint(equalTo: hobbyViewArray[index].trailingAnchor).isActive = true
            imgView.topAnchor.constraint(equalTo: hobbyViewArray[index].topAnchor, constant: Metrics.left * 1.5).isActive = true
            imgView.heightAnchor.constraint(equalToConstant: Metrics.width - Metrics.left).isActive = true
            imgView.widthAnchor.constraint(equalToConstant: Metrics.width - Metrics.left).isActive = true
        }
    }

}
