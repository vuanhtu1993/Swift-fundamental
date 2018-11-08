//
//  TableViewCellByPrograming.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 11/8/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class CustomCellByPrograming: UITableViewCell {
    
    // Cell element
    lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example"
        return label
    }()
    
    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.orange
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "CellID")
        
        // Setup view cell (bản chất là constrain)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        // Constraint for whole cell
//        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        contentView.frame = contentView.view.inset(by: margins)
        
        // Constraint for image
        contentView.backgroundColor = UIColor.blue
        contentView.addSubview(cellImage)
        cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cellImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Constraint for label
        contentView.addSubview(cellLabel)
        cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
