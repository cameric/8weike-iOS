//
//  PostTableViewCell.swift
//  Weike
//
//  Created by Weiyu Zhou on 10/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class PostTableViewCell: UITableViewCell {
    var post: Post? { didSet { postView.post = post } }

    fileprivate var postView = PostView()

    override func awakeFromNib() {
        super.awakeFromNib()

        addSubview(postView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
