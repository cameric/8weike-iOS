//
//  DebugTableViewController.swift
//  Weike
//
//  Created by Cam on 10/20/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class DebugTableViewController: WKUITableViewController {
    fileprivate let dataSource = DebugTableViewDataSource()

    override func loadView() {
        super.loadView()

        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource.delegate = self

        title = "More"
    }
}

extension DebugTableViewController: DebugTableViewDataSourceDelegate {
    func openExperiments() {
        print("not implemented")
    }

    func openHosts() {
        let controller = DebugHostsTableViewController()
        if let navController = navigationController {
            navController.pushViewController(controller, animated: true)
        }
    }

    func openViews() {
        let controller = DebugViewsTableViewController()
        if let navController = navigationController {
            navController.pushViewController(controller, animated: true)
        }
    }
}
