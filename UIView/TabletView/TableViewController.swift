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
    
    let listHuman = [
        Human(name: "Steve", description: "Steven Paul \"Steve\" Jobs là doanh nhân và nhà sáng chế người Mỹ. Ông là đồng sáng lập viên, chủ tịch, và cựu tổng giám đốc điều hành của hãng Apple", image: ""),
        Human(name: "Steve", description: "Steven Paul \"Steve\" Jobs là doanh nhân và nhà sáng chế người Mỹ. Ông là đồng sáng lập viên, chủ tịch, và cựu tổng giám đốc điều hành của hãng Apple", image: ""),
        Human(name: "Steve", description: "là một trong những người có ảnh hưởng lớn nhất ở ngành công nghiệp vi tính.", image: ""),
        Human(name: "Steve", description: "là một trong những người có ảnh hưởng lớn nhất ở ngành công nghiệp vi tính.", image: ""),
        Human(name: "Steve", description: "là một trong những người có ảnh hưởng lớn nhất ở ngành công nghiệp vi tính.", image: ""),
        Human(name: "Steve", description: "là một trong những người có ảnh hưởng lớn nhất ở ngành công nghiệp vi tính.", image: ""),
    ]


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
        return listHuman.count
    }
    
    // Chi tiet tung hang
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "testTableViewCell", for: indexPath) as! TableViewCell
        cell.setData(human: listHuman[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

