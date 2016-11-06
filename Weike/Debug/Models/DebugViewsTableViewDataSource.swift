//
//  DebugViewsTableViewDataSource.swift
//  Weike
//
//  Created by Cam on 11/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

fileprivate enum DebugViewsTableViewCells: Int, CaseCountable {
    case discover
    case login
    case signup

    var name: String {
        switch self {
        case .discover:
            return "Discover"
        case .login:
            return "Login"
        case .signup:
            return "Sign up"
        }
    }

    var selector: Selector! {
        switch self {
        case .discover:
            return #selector(DebugViewsTableViewDataSourceDelegate.openDiscoverView)
        case .login:
            return #selector(DebugViewsTableViewDataSourceDelegate.openLoginView)
        case .signup:
            return #selector(DebugViewsTableViewDataSourceDelegate.openSignupView)
        }
    }
}

@objc protocol DebugViewsTableViewDataSourceDelegate: class, NSObjectProtocol {
    func openDiscoverView()
    func openLoginView()
    func openSignupView()
}

class DebugViewsTableViewDataSource: NSObject {
    weak var delegate: DebugViewsTableViewDataSourceDelegate?
}

// MARK: UITableViewDataSource

extension DebugViewsTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DebugViewsTableViewCells.caseCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "value1")
        cell.textLabel?.text = DebugViewsTableViewCells(rawValue: indexPath.row)!.name
        return cell
    }
}

// MARK: UITableViewDelegate

extension DebugViewsTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = delegate?.perform(DebugViewsTableViewCells(rawValue: indexPath.row)!.selector)
    }
}
