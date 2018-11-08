//
//  TableViewCellDemo.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/23/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TableViewCellDemo: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var preparationImage: UIImageView!
    @IBOutlet weak var preparationLable: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        preparationImage.image = nil
        preparationLable.text = nil
    }
    
    func setValueForCell(preparationData: Preparation) {
        preparationLable.text = preparationData.info
        let data = try? Data(contentsOf: URL(string: preparationData.imageURL)!)
        DispatchQueue.main.async {
            self.preparationImage.image = UIImage(data: data!)
        }
    }
    
}
