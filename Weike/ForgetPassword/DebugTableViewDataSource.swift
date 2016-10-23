//
//  DebugTableViewDataSource.swift
//  Weike
//
//  Created by Cam on 10/22/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

fileprivate enum DebugTableViewCells: Int {
    case experiments
    case hosts
    case views

    /**
     * Because swift enum does not have a count,
     * We use the rawValue of the last type to get the count
     */
    static func count() -> Int {
        return views.rawValue + 1
    }

    func name() -> String {
        switch self {
        case .experiments:
            return "Experiments"
        case .hosts:
            return "Hosts"
        case .views:
            return "Views"
        }
    }

    func selector() -> Selector! {
        switch self {
        case .experiments:
            return #selector(DebugTableViewDataSourceDelegate.openExperiments)
        case .hosts:
            return #selector(DebugTableViewDataSourceDelegate.openHosts)
        case .views:
            return #selector(DebugTableViewDataSourceDelegate.openViews)
        }
    }
}

@objc protocol DebugTableViewDataSourceDelegate: class, NSObjectProtocol {
    func openExperiments()
    func openHosts()
    func openViews()
}

class DebugTableViewDataSource: NSObject {
    weak var delegate: DebugTableViewDataSourceDelegate?
}

// MARK: UITableViewDataSource

extension DebugTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DebugTableViewCells.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "value1")
        cell.textLabel?.text = DebugTableViewCells(rawValue: indexPath.row)!.name()
        return cell
    }
}

// MARK: UITableViewDelegate

extension DebugTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = delegate?.perform(DebugTableViewCells(rawValue: indexPath.row)!.selector())
    }
}
