//
//  CheckBox.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/24/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

protocol CheckBoxDelegate: class {
    func clickedCheckbox(_ status: Bool)
}

class CheckBoxView: UIView {

    var statusCheckbox: Bool = false
    weak var delegate: CheckBoxDelegate?
    
    @IBOutlet weak var checkboxBtn: UIButton!
    @IBOutlet weak var checkboxLb: UILabel!
    
    
    @IBAction func clickToCheckbox(_ sender: Any) {
        checkboxBtn.isSelected = !checkboxBtn.isSelected
        delegate?.clickedCheckbox(checkboxBtn.isSelected)
    }
    
    func changeStatus(status: Bool = false) {
        checkboxBtn.isSelected = status
    }
    
    class func loadView() -> CheckBoxView {
        let view: CheckBoxView = fromNib()
        return view
    }
    
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
