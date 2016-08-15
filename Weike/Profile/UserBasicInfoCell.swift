//
//  UserBasicInfoCell.swift
//  Weike
//
//  Created by Cam on 8/14/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

class UserBasicInfoCell: UITableViewCell {

    init(user: User, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
