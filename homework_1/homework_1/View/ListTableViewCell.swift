//
//  ListTableViewCell.swift
//  homework_1
//
//  Created by pavel on 30.10.21.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let id = "ListTableViewCell"
    
    let nameCarLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameCarLabel.frame = CGRect(x: Int(contentView.bounds.origin.x + 20), y: Int(contentView.bounds.origin.y + 15), width: Int(contentView.bounds.width - 40), height: 20)
        bodyLabel.frame = CGRect(x: Int(contentView.bounds.origin.x + 20), y: Int(contentView.bounds.origin.y + 45), width: Int(contentView.bounds.width - 40), height: 20)
        yearLabel.frame = CGRect(x: Int(contentView.bounds.origin.x + 20), y: Int(contentView.bounds.origin.y + 75), width: Int(contentView.bounds.width - 40), height: 20)
        
        contentView.addSubview(nameCarLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(yearLabel)
    }

}
