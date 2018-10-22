//
//  LifecycleViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/18/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class LifecycleViewController: UIViewController {

    @IBAction func buttonNavigate(_ sender: UIButton) {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
        self.navigationController?.pushViewController(screen2, animated: true)
    }
    
    let screen2 = Screeen2.createModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Man hinh 1: viewDidLoad")
        
        screen2.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Man hinh 1: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Man hinh 1: ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Man hinh 1: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Man hinh 1: viewDidDisappear")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    static func createModule() -> UINavigationController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "lifecycleViewController") as! LifecycleViewController
        let navigation = UINavigationController(rootViewController: view)
        return navigation
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Lifecycle",bundle: Bundle.main)
    }

}

extension LifecycleViewController: Screen2Delegate {
    func notify() {
        print("Screen 2 notify")
    }
}
