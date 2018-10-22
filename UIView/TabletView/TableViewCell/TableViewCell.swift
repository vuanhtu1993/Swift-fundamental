//
//  TableViewCell.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/18/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(human: Human) {
        labelName.text = human.name
        labelDescription.text = human.description
    }
}
