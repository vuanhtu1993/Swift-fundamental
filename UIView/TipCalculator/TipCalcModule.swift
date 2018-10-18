//
//  TipCalcModule.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/16/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import Foundation

class TipCalc {
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    init(amountBeforeTax: Float, tipPercentage: Float) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() -> Float {
        return amountBeforeTax + amountBeforeTax * tipPercentage
    }
}
