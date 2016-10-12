//
//  DiscoverTableViewDataSource.swift
//  Weike
//
//  Created by Weiyu Zhou on 10/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class DiscoverTableViewDataSource: NSObject {
    var posts: [Post]

    override init() {
        posts = [Post]()
    }
}

// MARK: UITableViewDataSource

extension DiscoverTableViewDataSource: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.post = posts[indexPath.row]
        return cell
    }
}

// MARK: UITableViewDelegate

extension DiscoverTableViewDataSource: UITableViewDelegate {


}
