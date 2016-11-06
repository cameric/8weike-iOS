//
//  Comment.swift
//  Weike
//
//  Created by Weiyu Zhou on 10/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class Comment: NSObject {
    var commenter: User
    var time: Date

    init(from commenter: User, at time: Date) {
        self.commenter = commenter
        self.time = time
        super.init()
    }
}
