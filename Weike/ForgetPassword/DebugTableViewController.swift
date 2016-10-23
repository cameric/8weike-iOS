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
        print("Yay")
    }

    func openHosts() {

    }

    func openViews() {

    }
}
