//
//  ProfileTableViewDataSource.swift
//  Weike
//
//  Created by Cam on 8/14/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class ProfileTableViewDataSource: NSObject {
}

extension ProfileTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        default:
            assertionFailure()
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return UserBasicInfoCell(user: User(id: "Test", name: "Name", phone: "Phone"), reuseIdentifier: "UserBasicInfo")
        case 1:
            return UserBasicInfoCell(user: User(id: "Test", name: "Name", phone: "Phone"), reuseIdentifier: "UserBasicInfo")
        case 2:
            return UserBasicInfoCell(user: User(id: "Test", name: "Name", phone: "Phone"), reuseIdentifier: "UserBasicInfo")
        default:
            assertionFailure()
            return UserBasicInfoCell(user: User(id: "Test", name: "Name", phone: "Phone"), reuseIdentifier: "UserBasicInfo")
        }
    }
}
