//
//  ProjectsTableViewCell.swift
//  cv
//
//  Created by pavel on 14.11.21.
//

import UIKit

final class ProjectsTableViewCell: UITableViewCell {
    
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
        imgView.layer.cornerRadius = Metrics.cornerRadius
        return imgView
    }()

    
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
                                                                 constant: Metrics.left)
        let topConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                              attribute: .top,
                                                                relatedBy: .equal,
                                                              toItem: contentView,
                                                              attribute: .top,
                                                              multiplier: 1,
                                                              constant: Metrics.left)
        let bottomConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                                 attribute: .bottom,
                                                                 relatedBy: .equal,
                                                                 toItem: contentView,
                                                                 attribute: .bottom,
                                                                 multiplier: 1,
                                                                 constant: Metrics.left)
        let widthConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1,
                                                         constant: Metrics.left * 3)
        let heightConstraintImageView = NSLayoutConstraint(item: projectImageView,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1,
                                                          constant: Metrics.left * 3)
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
                                                     constant: Metrics.bottom)
        let widthConstraintLabel = NSLayoutConstraint(item: nameProjectLabel,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: Metrics.width * 1.5)
        let heightConstraintLabel = NSLayoutConstraint(item: nameProjectLabel,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: Metrics.bottom * 3)
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
                                                    constant: Metrics.bottom)
        let rightConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
                                                    attribute: .right,
                                                    relatedBy: .equal,
                                                    toItem: contentView,
                                                    attribute: .right,
                                                    multiplier: 1,
                                                    constant: -Metrics.left)
        let bottomConstraintTextView = NSLayoutConstraint(item: descriptionProjectTextView,
                                                 attribute: .bottom,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .bottom,
                                                 multiplier: 1,
                                                 constant: Metrics.bottom * 3)
        addConstraints([topConstraintTextView, leftConstraintTextView, rightConstraintTextView,  bottomConstraintTextView])
    }

}
