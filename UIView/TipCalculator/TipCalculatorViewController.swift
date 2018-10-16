//
//  TipCalculatorViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/16/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    // MARK: IBOutLet
    @IBOutlet weak var amountBeforeTips: UITextField!
    @IBOutlet weak var percentTips: UILabel!
    @IBOutlet weak var percentTipSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func createModule() -> TipCalculatorViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "tipCalculatorViewController") as! TipCalculatorViewController
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"TipCalculator",bundle: Bundle.main)
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
