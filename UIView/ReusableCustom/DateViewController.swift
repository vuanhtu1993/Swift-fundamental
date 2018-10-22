//
//  DateViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/22/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showPicker(_ sender: Any) {
        // Cách 1: UIViewController - Storyboard
//        // Tao story board
//        let sb = UIStoryboard(name: "DatePicker", bundle: Bundle.main)
//        // Tao View
//        let view = sb.instantiateViewController(withIdentifier: "DatePickerPopup") as! DatePickerPopup
//        self.present(view, animated: true, completion: nil)
        
        // Cach 2: UIViewController - Nib
//        let controller = DatePickerPopup.init(nibName: "DatePickerNib", bundle: nil)
//        present(controller, animated: true, completion: nil)
        
        // Cach 3: UIView - Nib
        // Auto layout cho subView(v) được add vào superView (view)
        if let vi = DataPickerView.viewFromNib(), let v = vi.containerView {
            v.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(v)
            
            NSLayoutConstraint.activate([
                v.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                v.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//                v.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//                v.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                v.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                v.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            ])
        }
    }
    
    static func createModule() -> UINavigationController {
        let view = mainstosryboard.instantiateViewController(withIdentifier: "DataViewController") as! DateViewController
        let navigation = UINavigationController(rootViewController: view)
        return navigation
    }
    
    static var mainstosryboard: UIStoryboard {
        return UIStoryboard(name:"DateView",bundle: Bundle.main)
    }

}
