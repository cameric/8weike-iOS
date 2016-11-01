//
//  MoreTableViewDataSource.swift
//  Weike
//
//  Created by Cam on 10/20/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

protocol MoreTableViewDataSourceDelegate: class {
    func openDebugController()
}

class MoreTableViewDataSource: NSObject {
    weak var delegate: MoreTableViewDataSourceDelegate?
}

// MARK: UITableViewDataSource

extension MoreTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        case 3:
            return DEBUG ? 2 : 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0, 1, 2:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "value1")
            cell.textLabel?.text = "Placeholder"
            return cell
        case 3:
            return self.tableView(tableView, cellForSettingSectionRow: indexPath.row)
        default:
            assertionFailure("Unknown Tableview Section")
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, cellForSettingSectionRow row: Int) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "value1")

        switch row {
        case 0:
            cell.textLabel?.text = "Setting"
            break
        case 1:
            cell.textLabel?.text = "Debug"
            break
        default:
            assertionFailure("Unknown Tableview Row")
        }
        return cell
    }
}

// MARK: UITableViewDelegate

extension MoreTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0, 1, 2:
            break
        case 3:
            self.tableView(tableView, settingSectionDidDeselect: indexPath.row)
            break
        default:
            assertionFailure("Unknown Tableview Section")
        }
    }

    private func tableView(_ tableView: UITableView, settingSectionDidDeselect row: Int) {
        switch row {
        case 0:
            // Open Setting
            break
        case 1:
            // Open Debug menu
            delegate?.openDebugController()
            break
        default:
            return
        }
    }
}
