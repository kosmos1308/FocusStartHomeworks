//
//  SkillsViewController.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

class SkillsViewController: UIViewController {
    
    private let verticalInset: CGFloat = 8
    private let horizontalInset: CGFloat = 16
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.minimumLineSpacing = 16
      flowLayout.scrollDirection = .horizontal
      flowLayout.sectionInset = UIEdgeInsets(
        top: verticalInset,
        left: horizontalInset,
        bottom: verticalInset,
        right: horizontalInset)
      return flowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
      collectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: SkillsCollectionViewCell.cellIdentifier)
      collectionView.showsHorizontalScrollIndicator = false
      collectionView.alwaysBounceHorizontal = true
      collectionView.backgroundColor = .systemGroupedBackground
      collectionView.dataSource = self
      collectionView.delegate = self
    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
      return collectionView
    }()
    
    private lazy var projectsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My projects"
        label.font = UIFont(name: "Avenir", size: 30)
        label.backgroundColor = .systemGray6
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProjectsTableViewCell.self, forCellReuseIdentifier: ProjectsTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    
    var skillsArray = Skills.skillsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigation bar
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .systemGray
        title = "Skills"
        
        //image navigation bar
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.layer.cornerRadius = 20
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(tapPersonButton))
        navigationItem.titleView?.largeContentImage = UIImage(systemName: "person") //don't work
        
        
        //append skills in array
        let mySkills = ["UIKit", "AutoLayout", "StoryBoard", "CoreData", "Firebase"]
        for skill in mySkills {
            skillsArray.append(skill)
        }
        
        //collectionView
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
        //label "Project"
        view.addSubview(projectsLabel)
        setupProjectsLabelAutoLayout()
        
        //tableView
        view.addSubview(tableView)
        setupTableViewAutoLayout()
        
    }
    
    
    
    
    @objc func tapPersonButton() {
        print("person button")
    }
    
    
    //MARK: -
    func setupProjectsLabelAutoLayout() {
        NSLayoutConstraint.activate([projectsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), projectsLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20), projectsLabel.heightAnchor.constraint(equalToConstant: 35), projectsLabel.widthAnchor.constraint(equalToConstant: 200)])
    }
    
    
    
    func setupTableViewAutoLayout() {
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), tableView.topAnchor.constraint(equalTo: projectsLabel.bottomAnchor, constant: 20), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
    }

}

//MARK: -
extension SkillsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectsTableViewCell.id, for: indexPath)
        guard let projectCell = cell as? ProjectsTableViewCell else {return cell}
        
        projectCell.layoutSubviews()
        
        
        return projectCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}


//MARK: -
extension SkillsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillsCollectionViewCell.cellIdentifier, for: indexPath)
        guard let skillCell = cell as? SkillsCollectionViewCell else { return cell }
        //skillCell.layoutSubviews()
        skillCell.backgroundColor = .systemBlue
        skillCell.layer.cornerRadius = 10
        //skillCell.skillLabel.text = skillsArray[indexPath.item]
        
        skillCell.skillImage.image = UIImage(systemName: "folder")

        return skillCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 120)
    }
}

//MARK: -
extension UIView {
    func fillSuperview(withConstant constant: CGFloat = 0) {
        guard let superview = superview else {return}
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant),
                                     topAnchor.constraint(equalTo: superview.topAnchor, constant: 112),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -(superview.bounds.height/2 + 30))])
        
    }
}
