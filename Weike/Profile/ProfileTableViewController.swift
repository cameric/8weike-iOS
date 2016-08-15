//
//  ProfileTableViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//


class ProfileTableViewController: UITableViewController {
    // MARK: Views
    
    private let profileView = UITableView()
    private let profileDataSource = ProfileTableViewDataSource()
    
    // MARK: Initializers

    init() {
        super.init(style: .grouped)
        profileView.delegate = self
        profileView.dataSource = profileDataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UITableViewDelegate

extension ProfileTableViewController {
    
}
