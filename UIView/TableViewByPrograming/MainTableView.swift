//
//  MainTableView.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 11/8/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit

class MainTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .grouped)
        
        // delegate
        self.delegate = self
        self.dataSource = self
        
        // autolayout for tableview
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Register cell
        register(CustomCellByPrograming.self, forCellReuseIdentifier: "CellID")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! CustomCellByPrograming
        return cell
    }
    
}
