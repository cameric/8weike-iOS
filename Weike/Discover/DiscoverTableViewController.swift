
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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func loadView() {
        super.loadView()

        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Discover"
    }
}
