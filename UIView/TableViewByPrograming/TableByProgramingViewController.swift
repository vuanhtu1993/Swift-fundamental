//
//  TableByProgramingViewController.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 11/8/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TableByProgramingViewController: UIViewController {
    
    let tableView = MainTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView() {
        self.view.addSubview(tableView)
        // Constrainst
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}
