//
//  AutoLayoutViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/16/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    // MARK: IBOutLet
    @IBOutlet weak var iconImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2.0
        iconImage.clipsToBounds = true;
        // Do any additional setup after loading the view.
    }
    
    static func createModule() -> AutoLayoutViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "autoLayoutViewController") as! AutoLayoutViewController
        return view
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"AutoLayout",bundle: Bundle.main)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
