//
//  MoreTableViewController.swift
//  Weike
//
//  Created by Cam on 8/16/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class MoreTableViewController: WKUITableViewController {
    fileprivate var dataSource = MoreTableViewDataSource()

    override func loadView() {
        super.loadView()

        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource.delegate = self

        title = "More"
    }

    override func pullToRefresh() {
        // to-do
    }
}

extension MoreTableViewController: MoreTableViewDataSourceDelegate {
    func openDebugController() {
        let debugController = DebugTableViewController()
        if let navController = self.navigationController {
            navController.pushViewController(debugController, animated: true)
        }
    }
}
