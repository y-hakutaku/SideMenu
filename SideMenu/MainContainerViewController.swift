//
//  MainContainerViewController.swift
//  SideMenu
//
//  Created by Hakutaku on 2018/07/25.
//  Copyright © 2018年 Hakutaku. All rights reserved.
//

import UIKit

class MainContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainContainerViewController: UITableViewDelegate {
    
}

extension MainContainerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
    
    
}
