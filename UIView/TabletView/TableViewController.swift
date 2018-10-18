//
//  TabletViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/17/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    // MARK IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


    static func createModule() -> TableViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "tableViewController") as! TableViewController
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"TableView",bundle: Bundle.main)
    }

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    // So hang trong section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // Chi tiet tung hang
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "testTableViewCell", for: indexPath) as! TableViewCell
        cell.setData(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

