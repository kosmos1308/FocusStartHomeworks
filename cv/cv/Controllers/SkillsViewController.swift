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
      let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: flowLayout)
      collectionView.register(
        SkillsCollectionViewCell.self,
        forCellWithReuseIdentifier: SkillsCollectionViewCell.cellIdentifier)
      collectionView.showsHorizontalScrollIndicator = false
      collectionView.alwaysBounceHorizontal = true
      collectionView.backgroundColor = .systemGroupedBackground
      collectionView.dataSource = self
      collectionView.delegate = self
    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
      return collectionView
    }()
    
    var skillsArray = Skills.skillsArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigation bar
        view.backgroundColor = .systemGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .systemGray
        title = "Skills"
        
        //image navigation bar
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.layer.cornerRadius = 20
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(tapPersonButton))
        navigationItem.titleView?.largeContentImage = UIImage(systemName: "person")
        
        let mySkills = ["UIKit", "AutoLayout", "StoryBoard", "CoreData", "Firebase"]
        
    
        for skill in mySkills {
            skillsArray.append(skill)
        }
        
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
    }
    
    
    @objc func tapPersonButton() {
        print("person button")
    }

   

}

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




extension UIView {
  func fillSuperview(withConstant constant: CGFloat = 0) {
    guard let superview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(
      [leadingAnchor.constraint(
        equalTo: superview.leadingAnchor,
        constant: constant),
       topAnchor.constraint(
        equalTo: superview.topAnchor,
        constant: 120),
       trailingAnchor.constraint(
        equalTo: superview.trailingAnchor,
        constant: -constant),
       bottomAnchor.constraint(
        equalTo: superview.bottomAnchor,
        constant: -400)]
    )
  }
}
