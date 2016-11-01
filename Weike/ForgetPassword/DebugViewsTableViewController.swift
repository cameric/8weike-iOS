//
//  DebugViewsTableViewController.swift
//  Weike
//
//  Created by Cam on 11/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//


class DebugViewsTableViewController: UITableViewController {
    fileprivate let dataSource = DebugViewsTableViewDataSource()

    override func loadView() {
        super.loadView()

        tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource.delegate = self

        title = "More"
    }
}

extension DebugViewsTableViewController: DebugViewsTableViewDataSourceDelegate {
    func openDiscoverView() {
        print("not implemented")
    }

    func openLoginView() {
        let controller = LoginViewController()
        if let navController = navigationController {
            navController.pushViewController(controller, animated: true)
        }
    }

    func openSignupView() {
        let signupController = UINavigationController(rootViewController: SignupViewController())
        present(signupController, animated: true, completion: nil)
    }
}
