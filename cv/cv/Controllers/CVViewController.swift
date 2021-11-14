//
//  CVViewController.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

class CVViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.maximumZoomScale = 2
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: 414, height: 1000)
        return scrollView
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        label.text = "My name"
        label.font = UIFont(name: "Avenir", size: 30)
        return label
    }()
    
    let positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray6
        label.text = "My position"
        label.font = UIFont(name: "Avenir", size: 20)
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        label.text = "My location My location My location My location My location"
        label.font = UIFont(name: "Avenir", size: 20)
        label.textColor = .systemGray
        
        return label
    }()
    
    let locationImageView: UIImageView = { //add!!
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "location.circle")
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 20)
        label.text = "Description Description"
        label.backgroundColor = .systemBlue
        return label
    }()
    
    let skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 30)
        label.text = "Skills"
        label.backgroundColor = .systemBlue
        return label
    }()
    
    let personStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemBlue
        return stackView
    }()
    
    let skillsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemBlue
        return stackView
    }()
    
    let swiftSkillView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    let gitSkillView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    let englishSkillView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    let experienceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.text = "Experience"
        label.font = UIFont(name: "Avenir", size: 30)
        return label
    }()
    
    let experienceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemBlue
        return stackView
    }()
    
    let jobPositionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray6
        //label.text = "Student TeachMeSkills"
        label.font = UIFont(name: "Avenir", size: 20)
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        //label.text = "Trainee iOS Developer"
        label.font = UIFont(name: "Avenir", size: 20)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        //label.text = "May 2021 - Oct 2021"
        label.font = UIFont(name: "Avenir", size: 20)
        label.textColor = .systemGray
        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        //navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .systemGray
        title = "CV"
        
        updateNavBar()
        setupViews() //add scrollView, photo,
        
        setupScrollViewAutoLayout() //scroll
        setupPhotoImageViewAutoLayout() //photo
        setupLabelsAutoLayout() //labels(name, position, location, description) !!! change name
        
        setupDescriptionLabelAutoLayout() //description
        setupSkillsLabelAutoLayout() // skill label
        setupSkillsStackViewAutoLayout() //skill stackView
        setupExperienceLabelAutoLayout() //experience label
        
        setupCircleAndLineViews() //circles and lines views
        setupExpirienceStackViewAutoLayout() // expirience
        
        
        setupTextInLabels()
    }
    
    
    func updateNavBar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "circle.righthalf.fill"),
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
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(photoImageView)

        scrollView.addSubview(descriptionTextLabel)
        scrollView.addSubview(personStackView)
        scrollView.addSubview(skillsLabel)
        scrollView.addSubview(skillsStackView)
        scrollView.addSubview(experienceLabel)
        scrollView.addSubview(experienceStackView)
        
        personStackView.addArrangedSubview(fullNameLabel)
        personStackView.addArrangedSubview(positionLabel)
        personStackView.addArrangedSubview(locationLabel)
        //personStackView.addArrangedSubview(locationImageView)
        
        skillsStackView.addArrangedSubview(swiftSkillView)
        skillsStackView.addArrangedSubview(gitSkillView)
        skillsStackView.addArrangedSubview(englishSkillView)
        
        experienceStackView.addArrangedSubview(jobPositionLabel)
        experienceStackView.addArrangedSubview(companyLabel)
        experienceStackView.addArrangedSubview(dateLabel)
    }
    
    
    func setupTextInLabels() {
        let person = Person(name: "Pavel",
                            surname: "Pankevich",
                            photoName: "person.fill",
                            position: "IOS Developer",
                            city: "Minsk",
                            country: "Belarus")
        fullNameLabel.text = person.name + " " + person.surname
        photoImageView.image = UIImage(systemName: person.photoName)
        positionLabel.text = person.position
        locationLabel.text = person.city + ", " + person.country
        
        let experience = Experience(jobPosition: "Student",
                                    company: "Coding School TeachMeSkills",
                                    date: "May 2020 - Oct 2021")
        
        jobPositionLabel.text = experience.jobPosition
        companyLabel.text = experience.company
        dateLabel.text = experience.date
        
    }
    
    
    
    
    
    //MARK: - setup layout
    func setupScrollViewAutoLayout() {
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
            
       
    func setupPhotoImageViewAutoLayout() {
        photoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    func setupLabelsAutoLayout() {
        personStackView.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20).isActive = true
        personStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        //personStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        personStackView.widthAnchor.constraint(equalToConstant: 230).isActive = true
        personStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
//
//        fullNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
//        fullNameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20).isActive = true
//        fullNameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
//
//        positionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 2).isActive = true
//        positionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20).isActive = true
//        positionLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20).isActive = true
//
//        locationLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 2).isActive = true
//        locationLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 50).isActive = true
//        locationLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
//
//
//        locationImageView.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor).isActive = true
//        locationImageView.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20).isActive = true
//        locationImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
//        locationImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
    func setupDescriptionLabelAutoLayout() {
        descriptionTextLabel.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: 30).isActive = true
        descriptionTextLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        descriptionTextLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        descriptionTextLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    func setupSkillsLabelAutoLayout() {
        skillsLabel.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 30).isActive = true
        skillsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        skillsLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        skillsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func setupSkillsStackViewAutoLayout() {
        swiftSkillView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        swiftSkillView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        gitSkillView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        gitSkillView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        englishSkillView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        englishSkillView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        skillsStackView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 20).isActive = true
        skillsStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        skillsStackView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        skillsStackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    
    func setupExperienceLabelAutoLayout() {
        experienceLabel.topAnchor.constraint(equalTo: skillsStackView.bottomAnchor, constant: 30).isActive = true
        experienceLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        experienceLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        experienceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    //change method and
    func setupCircleAndLineViews() {
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.layer.cornerRadius = 4
        circleView.backgroundColor = .systemBlue
        scrollView.addSubview(circleView)
        
        circleView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        circleView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 50).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .systemBlue
        scrollView.addSubview(lineView)
        
        lineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 83).isActive = true
        lineView.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 15).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let secondCircleView = UIView()
        secondCircleView.translatesAutoresizingMaskIntoConstraints = false
        secondCircleView.layer.cornerRadius = 4
        secondCircleView.backgroundColor = .systemBlue
        scrollView.addSubview(secondCircleView)
        
        secondCircleView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        secondCircleView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15).isActive = true
        secondCircleView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        secondCircleView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        let secondLineView = UIView()
        secondLineView.translatesAutoresizingMaskIntoConstraints = false
        secondLineView.backgroundColor = .systemBlue
        scrollView.addSubview(secondLineView)
        
        secondLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 83).isActive = true
        secondLineView.topAnchor.constraint(equalTo: secondCircleView.bottomAnchor, constant: 15).isActive = true
        secondLineView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        secondLineView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let thirdCircleView = UIView()
        thirdCircleView.translatesAutoresizingMaskIntoConstraints = false
        thirdCircleView.layer.cornerRadius = 4
        thirdCircleView.backgroundColor = .systemBlue
        scrollView.addSubview(thirdCircleView)
        
        thirdCircleView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        thirdCircleView.topAnchor.constraint(equalTo: secondLineView.bottomAnchor, constant: 15).isActive = true
        thirdCircleView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        thirdCircleView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    
    func setupExpirienceStackViewAutoLayout() {
        experienceStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        experienceStackView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 20).isActive = true
        experienceStackView.widthAnchor.constraint(equalToConstant: 230).isActive = true
        experienceStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
    
    
    

}
