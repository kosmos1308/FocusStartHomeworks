//
//  CVViewController.swift
//  cv
//
//  Created by pavel on 13.11.21.
//

import UIKit

final class CVViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.maximumZoomScale = 2
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private let personVC = PersonVC()
    private let personStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let skillVC = SkillVC()
    private let skillsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let experienceVC = ExperienceVC()
    private let firstExperienceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let presentExperienceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let contactVC = ContactVC()
    private let contactsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "CV"

        setupViews()
        setupScrollViewAutoLayout()
        setupPhotoImageViewAutoLayout()
        setupPersonStackViewAutoLayout()
        setupDescriptionTextViewAutoLayout()
        setupSkillsLabelAutoLayout()
        setupSkillsStackViewAutoLayout()
        setupExperienceLabelAutoLayout()
        setupExpirienceStackViewsAutoLayout()
        setupCircleAndLineViews()
        setupContactsLabelAutoLayout()
        setupContactsStackViewsAutoLayout()   
        setupTextInLabels()
    }
    
    
    //MARK: - setup views
    private func setupViews() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 900)
        view.addSubview(scrollView)
        scrollView.addSubview(personVC.photoImageView)
        scrollView.addSubview(personVC.descriptionTextView)
        scrollView.addSubview(personStackView)
        scrollView.addSubview(skillVC.skillsLabel)
        scrollView.addSubview(skillsStackView)
        scrollView.addSubview(experienceVC.experienceLabel)
        scrollView.addSubview(firstExperienceStackView)
        scrollView.addSubview(presentExperienceStackView)
        scrollView.addSubview(experienceVC.firstCircleView)
        scrollView.addSubview(experienceVC.secondCircleView)
        scrollView.addSubview(experienceVC.lineView)
        scrollView.addSubview(contactVC.contactsLabel)
        scrollView.addSubview(contactsStackView)
        
        personStackView.addArrangedSubview(personVC.fullNameLabel)
        personStackView.addArrangedSubview(personVC.positionLabel)
        personStackView.addArrangedSubview(personVC.locationLabel)
        skillsStackView.addArrangedSubview(skillVC.swiftSkillView)
        skillsStackView.addArrangedSubview(skillVC.gitSkillView)
        skillsStackView.addArrangedSubview(skillVC.englishSkillView)
        firstExperienceStackView.addArrangedSubview(experienceVC.firstJobPositionLabel)
        firstExperienceStackView.addArrangedSubview(experienceVC.firstCompanyLabel)
        firstExperienceStackView.addArrangedSubview(experienceVC.firstDateWorkLabel)
        presentExperienceStackView.addArrangedSubview(experienceVC.presentJobPositionLabel)
        presentExperienceStackView.addArrangedSubview(experienceVC.presentCompanyLabel)
        presentExperienceStackView.addArrangedSubview(experienceVC.presentDateWorkLabel)
        contactsStackView.addArrangedSubview(contactVC.phoneLabel)
        contactsStackView.addArrangedSubview(contactVC.emailLabel)
        contactsStackView.addArrangedSubview(contactVC.telegramLabel)
    }
    
    
    //MARK: - setup text in labels
    private func setupTextInLabels() {
        let person = Person(name: "Pavel",
                            surname: "Pankevich",
                            photoName: "photo",
                            position: "Junior iOS Developer",
                            city: "📍 Minsk",
                            country: "Belarus")
        personVC.fullNameLabel.text = person.name + " " + person.surname
        personVC.photoImageView.image = UIImage(named: person.photoName)
        personVC.positionLabel.text = person.position
        personVC.locationLabel.text = person.city + ", " + person.country
        personVC.descriptionTextView.text = "Hardworking, responsible person. \nI can deal with difficult situations. Always do my best to achieve goals."
        
        let experience = Experience(jobPosition: "Student",
                                    company: "School TeachMeSkills",
                                    date: "May 2021 - Oct 2021")
        
        let presentExperience = Experience(jobPosition: "Trainee iOS Developer",
                                         company: "CFT",
                                         date: "Oct 2021 - Present")
        
        let experienceLabelsArray = [experienceVC.firstJobPositionLabel, experienceVC.firstCompanyLabel, experienceVC.firstDateWorkLabel, experienceVC.presentJobPositionLabel, experienceVC.presentCompanyLabel, experienceVC.presentDateWorkLabel]
        
        for label in experienceLabelsArray {
            label.font = UIFont(name: "Avenir", size: 20)
        }
        
        experienceVC.firstDateWorkLabel.textColor = .systemGray
        experienceVC.presentDateWorkLabel.textColor = .systemGray
        
        experienceVC.firstJobPositionLabel.text = experience.jobPosition
        experienceVC.firstCompanyLabel.text = experience.company
        experienceVC.firstDateWorkLabel.text = experience.date
        experienceVC.presentJobPositionLabel.text = presentExperience.jobPosition
        experienceVC.presentCompanyLabel.text = presentExperience.company
        experienceVC.presentDateWorkLabel.text = presentExperience.date
        
        let contacts = Contacts(phone: " 📞   +375 (29) 284-63-64", email: " ✉️   pasha13kosmos@gmail.com", telegram: " ✍️   @kosmos1308")
        let contactsLabelsArray = [contactVC.phoneLabel, contactVC.emailLabel, contactVC.telegramLabel]
        for contsct in contactsLabelsArray {
            contsct.font = UIFont(name: "Avenir", size: 20)
        }
        
        contactVC.phoneLabel.text = contacts.phone
        contactVC.emailLabel.text = contacts.email
        contactVC.telegramLabel.text = contacts.telegram
    }
    
    
    //MARK: - setup layout
    private func setupScrollViewAutoLayout() {
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
            
       
    private func setupPhotoImageViewAutoLayout() {
        personVC.photoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.left).isActive = true
        personVC.photoImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left).isActive = true
        personVC.photoImageView.widthAnchor.constraint(equalToConstant: Metrics.width).isActive = true
        personVC.photoImageView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
    }
    

    private func setupPersonStackViewAutoLayout() {
        personStackView.leftAnchor.constraint(equalTo: personVC.photoImageView.rightAnchor, constant: Metrics.left).isActive = true
        personStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.left).isActive = true
        personStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - personVC.photoImageView.bounds.width - Metrics.width - (Metrics.left * 3)).isActive = true
        personStackView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
    }
    
    
    private func setupDescriptionTextViewAutoLayout() {
        personVC.descriptionTextView.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: Metrics.left).isActive = true
        personVC.descriptionTextView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left).isActive = true
        personVC.descriptionTextView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        personVC.descriptionTextView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
    }
    
    
    private func setupSkillsLabelAutoLayout() {
        skillVC.skillsLabel.topAnchor.constraint(equalTo: personVC.descriptionTextView.bottomAnchor, constant: Metrics.left).isActive = true
        skillVC.skillsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left).isActive = true
        skillVC.skillsLabel.widthAnchor.constraint(equalToConstant: Metrics.width * 2).isActive = true
        skillVC.skillsLabel.heightAnchor.constraint(equalToConstant: Metrics.left * 1.5).isActive = true
    }
    
    
    private func setupSkillsStackViewAutoLayout() {
        //views
        let skillsViewArray = [skillVC.swiftSkillView, skillVC.gitSkillView, skillVC.englishSkillView]
        for skillView in skillsViewArray {
            skillView.translatesAutoresizingMaskIntoConstraints = false
            skillView.backgroundColor = .systemGray5
            skillView.layer.cornerRadius = Metrics.cornerRadius
            skillView.layer.shadowOpacity = 1
            
            skillView.widthAnchor.constraint(equalToConstant: Metrics.width).isActive = true
            skillView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
        }
        
        //imageViews
        let skillsImageViewsArray = [skillVC.swiftImageView, skillVC.gitImageView, skillVC.englishImageView]
        let nameImageArray = ["swift", "git", "english"]
        var index = -1
        for skillImageView in skillsImageViewsArray {
            index += 1
            skillImageView.translatesAutoresizingMaskIntoConstraints = false
            skillImageView.image = UIImage(named: nameImageArray[index])
            skillImageView.contentMode = .scaleAspectFit
            skillImageView.layer.shadowOpacity = 1
            skillsViewArray[index].addSubview(skillImageView)
            
            skillImageView.centerXAnchor.constraint(equalTo: skillsViewArray[index].centerXAnchor).isActive = true
            skillImageView.centerYAnchor.constraint(equalTo: skillsViewArray[index].centerYAnchor).isActive = true
            skillImageView.widthAnchor.constraint(equalToConstant: Metrics.left * 2).isActive = true
            skillImageView.heightAnchor.constraint(equalToConstant: Metrics.left * 2).isActive = true
        }
     
        //labels
        let skillLabelsArray = [skillVC.swiftLabel, skillVC.gitLabel, skillVC.englishLabel]
        let skillTextArray = ["Swift", "Git", "English B1"]
        var number = -1
        for label in skillLabelsArray {
            number += 1
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "Avenir Heavy", size: 15)
            label.textAlignment = .center
            label.text = skillTextArray[number]
            skillsViewArray[number].addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: skillsViewArray[number].centerXAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: skillsViewArray[number].leadingAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: skillsViewArray[number].bottomAnchor, constant: 0).isActive = true
            label.trailingAnchor.constraint(equalTo: skillsViewArray[number].trailingAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: Metrics.width/5).isActive = true
        }
             
        skillsStackView.topAnchor.constraint(equalTo: skillVC.skillsLabel.bottomAnchor, constant: Metrics.bottom).isActive = true
        skillsStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left).isActive = true
        skillsStackView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
        skillsStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - (Metrics.left * 2)).isActive = true
    }
    
    
    private func setupExperienceLabelAutoLayout() {
        experienceVC.experienceLabel.topAnchor.constraint(equalTo: skillsStackView.bottomAnchor, constant: Metrics.left * 1.5).isActive = true
        experienceVC.experienceLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left).isActive = true
        experienceVC.experienceLabel.widthAnchor.constraint(equalToConstant: Metrics.width * 2).isActive = true
        experienceVC.experienceLabel.heightAnchor.constraint(equalToConstant: Metrics.left * 1.5).isActive = true
    }
    
    
    private func setupCircleAndLineViews() {
        let circleArray = [experienceVC.firstCircleView, experienceVC.secondCircleView]
        var index = -1
        for circle in circleArray {
            circle.translatesAutoresizingMaskIntoConstraints = false
            circle.layer.cornerRadius = Metrics.circleWidth/2
            circle.layer.shadowOpacity = 1
            circle.backgroundColor = .systemGray5
            
            index += 1
            circle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left * 1.5).isActive = true
            circle.widthAnchor.constraint(equalToConstant: Metrics.circleWidth).isActive = true
            circle.heightAnchor.constraint(equalToConstant: Metrics.circleWidth).isActive = true
            
            if index == 0 {
                circle.centerYAnchor.constraint(equalTo: firstExperienceStackView.centerYAnchor).isActive = true
                
                experienceVC.lineView.translatesAutoresizingMaskIntoConstraints = false
                experienceVC.lineView.backgroundColor = .systemGray5
                experienceVC.lineView.layer.shadowOpacity = 1
                
                experienceVC.lineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.width/3).isActive = true
                experienceVC.lineView.topAnchor.constraint(equalTo: circleArray[0].bottomAnchor, constant: Metrics.circleTop).isActive = true
                experienceVC.lineView.bottomAnchor.constraint(equalTo: circleArray[1].topAnchor, constant: -Metrics.circleTop).isActive = true
                experienceVC.lineView.widthAnchor.constraint(equalToConstant: Metrics.circleWidth/4).isActive = true
            } else {
                circle.centerYAnchor.constraint(equalTo: presentExperienceStackView.centerYAnchor).isActive = true
            }
        }
    }
    

    private func setupExpirienceStackViewsAutoLayout() {
        firstExperienceStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        firstExperienceStackView.topAnchor.constraint(equalTo: experienceVC.experienceLabel.bottomAnchor, constant: Metrics.bottom).isActive = true
        firstExperienceStackView.widthAnchor.constraint(equalToConstant: view.bounds.width/2 + Metrics.width/2).isActive = true
        firstExperienceStackView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
        
        presentExperienceStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        presentExperienceStackView.topAnchor.constraint(equalTo: firstExperienceStackView.bottomAnchor, constant: Metrics.left * 2).isActive = true
        presentExperienceStackView.widthAnchor.constraint(equalToConstant: view.bounds.width/2 + Metrics.width/2).isActive = true
        presentExperienceStackView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
    }
    
    
    private func setupContactsLabelAutoLayout() {
        contactVC.contactsLabel.topAnchor.constraint(equalTo: presentExperienceStackView.bottomAnchor, constant: Metrics.left * 1.5).isActive = true
        contactVC.contactsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Metrics.left).isActive = true
        contactVC.contactsLabel.widthAnchor.constraint(equalToConstant: Metrics.width * 2).isActive = true
        contactVC.contactsLabel.heightAnchor.constraint(equalToConstant: Metrics.width/3).isActive = true
    }
    
    
    private func setupContactsStackViewsAutoLayout() {
        contactsStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contactsStackView.topAnchor.constraint(equalTo: contactVC.contactsLabel.bottomAnchor, constant: Metrics.bottom).isActive = true
        contactsStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - (Metrics.left * 2)).isActive = true
        contactsStackView.heightAnchor.constraint(equalToConstant: Metrics.width).isActive = true
    }
}
