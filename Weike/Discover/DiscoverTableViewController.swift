
//
//  DiscoverTableViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class DiscoverViewController: WKUITableViewController {
    fileprivate var dataSource = DiscoverTableViewDataSource()

    init() {
        super.init(nibName: nil, bundle: nil)
        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        title = "Discover"
    }
}
