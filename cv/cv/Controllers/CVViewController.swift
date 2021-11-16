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
    
    //person
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let personStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 20)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 20)
        label.textColor = .systemGray
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "Avenir", size: 20)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    //skills
    private let skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        label.text = "Skills"
        return label
    }()
    
    private let skillsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let swiftSkillView = UIView()
    private let gitSkillView = UIView()
    private let englishSkillView = UIView()
    private let swiftImageView = UIImageView()
    private let gitImageView = UIImageView()
    private let englishImageView = UIImageView()
    let swiftLabel = UILabel()
    let gitLabel = UILabel()
    let englishLabel = UILabel()
    
    //experience
    private let experienceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Experience"
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        return label
    }()
    
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
    
    private let firstJobPositionLabel = UILabel()
    private let firstCompanyLabel = UILabel()
    private let firstDateWorkLabel = UILabel()
    private let presentJobPositionLabel = UILabel()
    private let presentCompanyLabel = UILabel()
    private let presentDateWorkLabel = UILabel()
    
    private let firstCircleView = UIView()
    private let secondCircleView = UIView()
    private let lineView = UIView()
    
    //contacts
    private let contactsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contacts"
        label.font = UIFont(name: "Avenir Heavy", size: 30)
        return label
    }()
    
    private let contactsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()
    private let telegramLabel = UILabel()
    
    private let left: CGFloat = 20
    private let top: CGFloat = 20
    private let width: CGFloat = 100
    private let height: CGFloat = 100
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "CV"

        setupViews()
        setupScrollViewAutoLayout()         // scrollView
        setupPhotoImageViewAutoLayout()     // photo
        setupPersonStackViewAutoLayout()    // personStackView (name, position, location, description)
        setupDescriptionTextViewAutoLayout() // description
        setupSkillsLabelAutoLayout()         // label "Skills"
        setupSkillsStackViewAutoLayout()      // skill stackView
        setupExperienceLabelAutoLayout()      // label "Experience"
        setupExpirienceStackViewsAutoLayout() // expirienceStackViews
        setupCircleAndLineViews()            // circles and line views
        setupContactsLabelAutoLayout()        //label "Contacts"
        setupContactsStackViewsAutoLayout()   //contacts stackView
        setupTextInLabels()
    }
    
    
    //MARK: - setup views
    private func setupViews() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 900)
        view.addSubview(scrollView)
        scrollView.addSubview(photoImageView)
        scrollView.addSubview(descriptionTextView)
        scrollView.addSubview(personStackView)
        scrollView.addSubview(skillsLabel)
        scrollView.addSubview(skillsStackView)
        scrollView.addSubview(experienceLabel)
        scrollView.addSubview(firstExperienceStackView)
        scrollView.addSubview(presentExperienceStackView)
        scrollView.addSubview(firstCircleView)
        scrollView.addSubview(secondCircleView)
        scrollView.addSubview(lineView)
        scrollView.addSubview(contactsLabel)
        scrollView.addSubview(contactsStackView)
        
        personStackView.addArrangedSubview(fullNameLabel)
        personStackView.addArrangedSubview(positionLabel)
        personStackView.addArrangedSubview(locationLabel)
        skillsStackView.addArrangedSubview(swiftSkillView)
        skillsStackView.addArrangedSubview(gitSkillView)
        skillsStackView.addArrangedSubview(englishSkillView)
        firstExperienceStackView.addArrangedSubview(firstJobPositionLabel)
        firstExperienceStackView.addArrangedSubview(firstCompanyLabel)
        firstExperienceStackView.addArrangedSubview(firstDateWorkLabel)
        presentExperienceStackView.addArrangedSubview(presentJobPositionLabel)
        presentExperienceStackView.addArrangedSubview(presentCompanyLabel)
        presentExperienceStackView.addArrangedSubview(presentDateWorkLabel)
        contactsStackView.addArrangedSubview(phoneLabel)
        contactsStackView.addArrangedSubview(emailLabel)
        contactsStackView.addArrangedSubview(telegramLabel)
    }
    
    
    //MARK: - setup text in labels
    private func setupTextInLabels() {
        let person = Person(name: "Pavel",
                            surname: "Pankevich",
                            photoName: "photo",
                            position: "Junior iOS Developer",
                            city: "📍 Minsk",
                            country: "Belarus")
        fullNameLabel.text = person.name + " " + person.surname
        photoImageView.image = UIImage(named: person.photoName)
        positionLabel.text = person.position
        locationLabel.text = person.city + ", " + person.country
        descriptionTextView.text = "Hardworking, responsible person. \nI can deal with difficult situations. Always do my best to achieve goals."
        
        let experience = Experience(jobPosition: "Student",
                                    company: "School TeachMeSkills",
                                    date: "May 2020 - Oct 2021")
        
        let presentExperience = Experience(jobPosition: "Trainee iOS Developer",
                                         company: "CFT",
                                         date: "Oct 2021 - Present")
        
        let experienceLabelsArray = [firstJobPositionLabel, firstCompanyLabel, firstDateWorkLabel, presentJobPositionLabel, presentCompanyLabel, presentDateWorkLabel]
        
        for label in experienceLabelsArray {
            label.font = UIFont(name: "Avenir", size: 20)
        }
        
        firstDateWorkLabel.textColor = .systemGray
        presentDateWorkLabel.textColor = .systemGray
        
        firstJobPositionLabel.text = experience.jobPosition
        firstCompanyLabel.text = experience.company
        firstDateWorkLabel.text = experience.date
        presentJobPositionLabel.text = presentExperience.jobPosition
        presentCompanyLabel.text = presentExperience.company
        presentDateWorkLabel.text = presentExperience.date
        
        let contacts = Contacts(phone: " 📞   +375 (29) 284-63-64", email: " ✉️   pasha13kosmos@gmail.com", telegram: " ✍️   @kosmos1308")
        let contactsLabelsArray = [phoneLabel, emailLabel, telegramLabel]
        for contsct in contactsLabelsArray {
            contsct.font = UIFont(name: "Avenir", size: 20)
        }
        
        phoneLabel.text = contacts.phone
        emailLabel.text = contacts.email
        telegramLabel.text = contacts.telegram
    }
    
    
    //MARK: - setup layout
    private func setupScrollViewAutoLayout() {
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
            
       
    private func setupPhotoImageViewAutoLayout() {
        photoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: top).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    

    private func setupPersonStackViewAutoLayout() {
        personStackView.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: left).isActive = true
        personStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: top).isActive = true
        personStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - photoImageView.bounds.width - width - (left * 3)).isActive = true
        personStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
    private func setupDescriptionTextViewAutoLayout() {
        descriptionTextView.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: top).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
    private func setupSkillsLabelAutoLayout() {
        skillsLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: top).isActive = true
        skillsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left).isActive = true
        skillsLabel.widthAnchor.constraint(equalToConstant: width * 2).isActive = true
        skillsLabel.heightAnchor.constraint(equalToConstant: left * 1.5).isActive = true
    }
    
    
    private func setupSkillsStackViewAutoLayout() {
        //views
        let skillsViewArray = [swiftSkillView, gitSkillView, englishSkillView]
        for skillView in skillsViewArray {
            skillView.translatesAutoresizingMaskIntoConstraints = false
            skillView.backgroundColor = .systemGray5
            skillView.layer.cornerRadius = 10
            skillView.layer.shadowOpacity = 1
            
            skillView.widthAnchor.constraint(equalToConstant: width).isActive = true
            skillView.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        //imageViews
        let skillsImageViewsArray = [swiftImageView, gitImageView, englishImageView]
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
            skillImageView.widthAnchor.constraint(equalToConstant: left * 2).isActive = true
            skillImageView.heightAnchor.constraint(equalToConstant: left * 2).isActive = true
        }
     
        //labels
        let skillLabelsArray = [swiftLabel, gitLabel, englishLabel]
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
            label.heightAnchor.constraint(equalToConstant: height/5).isActive = true
        }
             
        skillsStackView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 10).isActive = true
        skillsStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left).isActive = true
        skillsStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        skillsStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - (left * 2)).isActive = true
    }
    
    
    private func setupExperienceLabelAutoLayout() {
        experienceLabel.topAnchor.constraint(equalTo: skillsStackView.bottomAnchor, constant: top * 1.5).isActive = true
        experienceLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left).isActive = true
        experienceLabel.widthAnchor.constraint(equalToConstant: width * 2).isActive = true
        experienceLabel.heightAnchor.constraint(equalToConstant: left * 1.5).isActive = true
    }
    
    
    private func setupCircleAndLineViews() {
        let circleArray = [firstCircleView, secondCircleView]
        var index = -1
        for circle in circleArray {
            circle.translatesAutoresizingMaskIntoConstraints = false
            circle.layer.cornerRadius = 4
            circle.layer.shadowOpacity = 1
            circle.backgroundColor = .systemGray5
            
            index += 1
            circle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left * 1.5).isActive = true
            circle.widthAnchor.constraint(equalToConstant: 8).isActive = true
            circle.heightAnchor.constraint(equalToConstant: 8).isActive = true
            
            if index == 0 {
                circle.centerYAnchor.constraint(equalTo: firstExperienceStackView.centerYAnchor).isActive = true
                
                lineView.translatesAutoresizingMaskIntoConstraints = false
                lineView.backgroundColor = .systemGray5
                lineView.layer.shadowOpacity = 1
                
                lineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 33).isActive = true
                lineView.topAnchor.constraint(equalTo: circleArray[0].bottomAnchor, constant: 15).isActive = true
                lineView.bottomAnchor.constraint(equalTo: circleArray[1].topAnchor, constant: -15).isActive = true
                lineView.widthAnchor.constraint(equalToConstant: 2).isActive = true
            } else {
                circle.centerYAnchor.constraint(equalTo: presentExperienceStackView.centerYAnchor).isActive = true
            }
        }
    }
    

    private func setupExpirienceStackViewsAutoLayout() {
        firstExperienceStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        firstExperienceStackView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: top/2).isActive = true
        firstExperienceStackView.widthAnchor.constraint(equalToConstant: view.bounds.width/2 + width/2).isActive = true
        firstExperienceStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        presentExperienceStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        presentExperienceStackView.topAnchor.constraint(equalTo: firstExperienceStackView.bottomAnchor, constant: top * 2).isActive = true
        presentExperienceStackView.widthAnchor.constraint(equalToConstant: view.bounds.width/2 + width/2).isActive = true
        presentExperienceStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
    private func setupContactsLabelAutoLayout() {
        contactsLabel.topAnchor.constraint(equalTo: presentExperienceStackView.bottomAnchor, constant: top * 1.5).isActive = true
        contactsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: left).isActive = true
        contactsLabel.widthAnchor.constraint(equalToConstant: width * 2).isActive = true
        contactsLabel.heightAnchor.constraint(equalToConstant: height/3).isActive = true
    }
    
    
    private func setupContactsStackViewsAutoLayout() {
        contactsStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contactsStackView.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor, constant: top/2).isActive = true
        contactsStackView.widthAnchor.constraint(equalToConstant: view.bounds.width - (left * 2)).isActive = true
        contactsStackView.heightAnchor.constraint(equalToConstant: width).isActive = true
    }
}
