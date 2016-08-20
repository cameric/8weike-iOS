//
//  ProfileTableViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//


class ProfileTableViewController: UITableViewController {
    // MARK: Properties
    
    private let profileDataSource = ProfileTableViewDataSource()
    
    // MARK: Initializers

    init() {
        super.init(style: .grouped)
        title = "Profile"
        tableView.delegate = self
        tableView.dataSource = profileDataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UITableViewDelegate

extension ProfileTableViewController {
    
}
