//
//  Screeen2.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/18/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

protocol Screen2Delegate {
    func notify()
}

class Screeen2: UIViewController {

    @IBAction func buttonNavigate(_ sender: UIButton) {
        delegate?.notify()
    }
    
    var delegate: Screen2Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func createModule() -> Screeen2 {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "screen2") as! Screeen2
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Lifecycle",bundle: Bundle.main)
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
