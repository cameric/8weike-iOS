//
//  DebugHostsTableViewController.swift
//  Weike
//
//  Created by Cam on 11/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class DebugHostsTableViewController: UITableViewController {
    fileprivate let dataSource = DebugHostsTableViewDataSource()

    override func loadView() {
        super.loadView()

        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource.delegate = self

        title = "Hosts"
    }
}

extension DebugHostsTableViewController: DebugHostsTableViewDataSourceDelegate {
    func useProdHost() {
        APIRequest.host = .prod
    }

    func useTestHost() {
        APIRequest.host = .test
    }
}
