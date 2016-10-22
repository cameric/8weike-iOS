
//
//  DiscoverTableViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class DiscoverViewController: WKUITableViewController {
    fileprivate var dataSource = DiscoverTableViewDataSource()

    override func loadView() {
        super.loadView()

        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))

        title = "Discover"
    }

    override func pullToRefresh() {
        // to-do
    }
}
