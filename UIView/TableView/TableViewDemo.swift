//
//  TableViewTest.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/23/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class TableViewDemo: UIViewController {

    // MARK: IB Outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Run into tableView delegate
        self.setupTableView()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Setup TableView
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: Create ViewController
    static func createModule() -> UINavigationController {
        let view = mainstosryboard.instantiateViewController(withIdentifier: "TableViewDemo") as! TableViewDemo
        let navigation = UINavigationController(rootViewController: view)
        return navigation
    }
    
    static var mainstosryboard: UIStoryboard {
        return UIStoryboard(name:"TableViewDemo",bundle: nil)
    }
}

extension TableViewDemo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell: TableViewCellDemo?
        if row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cellRight", for: indexPath) as? TableViewCellDemo
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cellLeft", for: indexPath) as? TableViewCellDemo
        }
        if let unwrapedCell = cell {
            return unwrapedCell
        }
        return UITableViewCell()
    }
    
    
}
