//
//  TipCalculatorViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/16/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    // MARK: IBOuttet
    @IBOutlet weak var amountBeforeTipsTextField: UITextField!
    @IBOutlet weak var percentTips: UILabel!
    @IBOutlet weak var percentTipSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Properties
    var tipCalc = TipCalc(amountBeforeTax: 20.0, tipPercentage: 0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        amountBeforeTipsTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        percentTips.text = String(format: "Tip %d%%", arguments: [Int(tipCalc.tipPercentage * 100)])
    }
    
    static func createModule() -> TipCalculatorViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "tipCalculatorViewController") as! TipCalculatorViewController
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"TipCalculator",bundle: Bundle.main)
    }
    
    func monitorPercentSlider() {
        tipCalc.tipPercentage = Float(percentTipSlider.value)
        tipCalc.amountBeforeTax = ((amountBeforeTipsTextField.text)! as NSString).floatValue
        tipCalc.calculateTip()
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
