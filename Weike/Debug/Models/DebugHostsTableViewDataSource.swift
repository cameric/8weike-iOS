//
//  DebugHostsTableViewDataSource.swift
//  Weike
//
//  Created by Cam on 11/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

fileprivate enum DebugHostsTableViewCells: Int, CaseCountable {
    case prod
    case test

    var name: String {
        switch self {
        case .prod:
            return "Prod"
        case .test:
            return "Test"
        }
    }

    var selector: Selector! {
        switch self {
        case .prod:
            return #selector(DebugHostsTableViewDataSourceDelegate.useProdHost)
        case .test:
            return #selector(DebugHostsTableViewDataSourceDelegate.useTestHost)
        }
    }
}

@objc protocol DebugHostsTableViewDataSourceDelegate: class, NSObjectProtocol {
    func useProdHost()
    func useTestHost()
}

class DebugHostsTableViewDataSource: NSObject {
    weak var delegate: DebugHostsTableViewDataSourceDelegate?
}

// MARK: UITableViewDataSource

extension DebugHostsTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DebugHostsTableViewCells.caseCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "value1")
        cell.textLabel?.text = DebugHostsTableViewCells(rawValue: indexPath.row)!.name
        return cell
    }
}

// MARK: UITableViewDelegate

extension DebugHostsTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = delegate?.perform(DebugHostsTableViewCells(rawValue: indexPath.row)!.selector)
    }
}
