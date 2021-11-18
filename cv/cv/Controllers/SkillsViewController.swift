//
//  SkillsViewController.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

final class SkillsViewController: UIViewController {
    
    private let verticalInset: CGFloat = 8
    private let horizontalInset: CGFloat = 16
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 16
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: verticalInset,
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
        collectionView.backgroundColor = .white
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
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProjectsTableViewCell.self, forCellReuseIdentifier: ProjectsTableViewCell.id)
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var skills = Skills()
    private var projectArray = [Project]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(projectsLabel)
        view.addSubview(tableView)
        
        updateNavigationBar()
        appendSkills()
        appendProjects()
        setupCollectionViewAutoLayout()
        setupProjectsLabelAutoLayout()
        setupTableViewAutoLayout()
    }
    
    private func updateNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .white
        title = "Skills"
    }
    
    //MARK: - append skills and projects
    private func appendSkills() {
        let mySkills = ["UIKit", "AutoLayout", "StoryBoard", "CoreData", "Firebase", "JSON", "API", "Gitflow"]
        for skill in mySkills {
            skills.nameArray.append(skill)
        }
    }
    
    private func appendProjects() {
        let weatherProject = Project(name: "Weather",
                                     description: "This project about ...",
                                     nameImage: "weather")
        let noteBookProject = Project(name: "Note",
                                      description: "This project about ...",
                                      nameImage: "note")
        projectArray.append(weatherProject)
        projectArray.append(noteBookProject)
    }
    
    //MARK: - AutoLayout
    private func setupProjectsLabelAutoLayout() {
        NSLayoutConstraint.activate([
            projectsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.left),
            projectsLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Metrics.left),
            projectsLabel.heightAnchor.constraint(equalToConstant: Metrics.width/3),
            projectsLabel.widthAnchor.constraint(equalToConstant: Metrics.width * 2)])
    }
    
    private func setupTableViewAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: projectsLabel.bottomAnchor, constant: Metrics.left),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
    }
    
    private func setupCollectionViewAutoLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: Metrics.top),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.bounds.height/2 + (Metrics.left * 2)))])
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension SkillsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectsTableViewCell.id, for: indexPath)
        guard let projectCell = cell as? ProjectsTableViewCell else {return cell}
        projectCell.layoutSubviews()
        projectCell.backgroundColor = .white
        projectCell.projectImageView.image = UIImage(named: projectArray[indexPath.row].nameImage)
        projectCell.nameProjectLabel.text = projectArray[indexPath.row].name
        projectCell.descriptionProjectTextView.text = projectArray[indexPath.row].description
        return projectCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Metrics.width
    }
}

//MARK: - UICollectionViewDataSource
extension SkillsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return skills.nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillsCollectionViewCell.cellIdentifier, for: indexPath)
        guard let skillCell = cell as? SkillsCollectionViewCell else { return cell }
        skillCell.backgroundColor = .systemGray4
        skillCell.layer.cornerRadius = 10
        skillCell.layer.shadowOpacity = 1
        skillCell.skillLabel.text = skills.nameArray[indexPath.item]
        skillCell.skillImage.image = UIImage(named: skills.nameArray[indexPath.item])

        return skillCell
    }
}

//MARK: - UICollectionViewDelegate
extension SkillsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Metrics.width, height: Metrics.width + Metrics.left)
    }
}

