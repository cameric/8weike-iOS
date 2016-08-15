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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
