//
//  DataPickerView.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/22/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class DataPickerView: UIView {

    @IBOutlet weak var containerView: UIView!
    
    class func viewFromNib() -> DataPickerView? {
        let view =  UINib(nibName: "DatePickerNib", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? DataPickerView
        return view
    }
    
}
