//
//  ProjectsTableViewCell.swift
//  cv
//
//  Created by pavel on 14.11.21.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {
    
    static let id = "ProjectsTableViewCell"
    
    let nameProjectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My first project"
        label.font = UIFont(name: "Avenir Heavy", size: 15)
        return label
    }()
    
    let descriptionProjectTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Avenir", size: 15)
        return textView
    }()
    
    lazy var projectImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 10
        return imgView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        addSubview(projectImageView)
        addSubview(nameProjectLabel)
        addSubview(descriptionProjectTextView)
        
        //imageView
        let leftConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                                 attribute: .left,
                                                                 relatedBy: .equal,
                                                                 toItem: contentView,
                                                                 attribute: .left,
                                                                 multiplier: 1,
                                                                 constant: 20)
        let topConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                              attribute: .top,
                                                                relatedBy: .equal,
                                                              toItem: contentView,
                                                              attribute: .top,
                                                              multiplier: 1,
                                                              constant: 20)
        let bottomConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                                 attribute: .bottom,
                                                                 relatedBy: .equal,
                                                                 toItem: contentView,
                                                                 attribute: .bottom,
                                                                 multiplier: 1,
                                                                 constant: 20)
        let widthConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1,
                                                         constant: 60)
        let heightConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1,
                                                          constant: 60)
        addConstraints([leftConstraintImageView, topConstraintImageView, bottomConstraintImageView, widthConstraintImageView, heightConstraintImageView])
        
        //label
        let topConstraintLabel = NSLayoutConstraint(item: nameProjectLabel,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: contentView,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 0)
        let leftConstraintLabel = NSLayoutConstraint(item: nameProjectLabel,
                                                     attribute: .left,
                                                     relatedBy: .equal,
                                                     toItem: projectImageView,
                                                     attribute: .right,
                                                     multiplier: 1,
                                                       constant: 10)
        let widthConstraintLabel = NSLayoutConstraint(item: nameProjectLabel,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 150)
        let heightConstraintLabel = NSLayoutConstraint(item: nameProjectLabel,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 30)
        addConstraints([topConstraintLabel, leftConstraintLabel, widthConstraintLabel, heightConstraintLabel])
        
        //textView
        let topConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: nameProjectLabel,
                                                      attribute: .bottom,
                                                      multiplier: 1,
                                                      constant: 0)
        let leftConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: projectImageView,
                                                    attribute: .right,
                                                    multiplier: 1,
                                                    constant: 10)
        let rightConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
                                                    attribute: .right,
                                                    relatedBy: .equal,
                                                    toItem: contentView,
                                                    attribute: .right,
                                                    multiplier: 1,
                                                    constant: -20)
        let bottomConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
                                                 attribute: .bottom,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .bottom,
                                                 multiplier: 1,
                                                 constant: 30)
//        let widthConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
//                                                 attribute: .width,
//                                                 relatedBy: .equal,
//                                                 toItem: nil,
//                                                 attribute: .notAnAttribute,
//                                                 multiplier: 1,
//                                                 constant: contentView.bounds.width - projectImageView.bounds.width - 60)
        addConstraints([topConstraintTextView, leftConstraintTextView, rightConstraintTextView,  bottomConstraintTextView/*, widthConstraintTextView*/])
    }

}
