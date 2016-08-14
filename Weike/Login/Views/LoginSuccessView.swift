//
//  LoginSuccessView.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(22)

class LoginSuccessView: UIView {
    
    // MARK: Views
    
    let loginSuccessMessageLabel = UILabel()
    let loginSuccessImageView = UIImageView(image: UIImage(named: "success")!)
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([loginSuccessMessageLabel, loginSuccessImageView])
        installConstraints()
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        backgroundColor = UIColor.main()
        
        // Message related
        let messageFont = UIFont(name: "SourceHanSansCN-Normal", size: 10) ?? UIFont.systemFont(ofSize: 10)
        
        loginSuccessMessageLabel.text = "登录成功"
        loginSuccessMessageLabel.font = messageFont
        loginSuccessMessageLabel.textColor = UIColor.white
        loginSuccessMessageLabel.textAlignment = NSTextAlignment.center
        
        // Image related
        loginSuccessImageView.isUserInteractionEnabled = false // TODO: Make it enabled, a button leading to main page?
    }
    
    private func installConstraints() {
        let views = ["loginSuccessMessageLabel": loginSuccessMessageLabel,
                     "loginSuccessImageView": loginSuccessImageView]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()
        
        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[loginSuccessMessageLabel]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[loginSuccessImageView]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        
        // Vertical constraints
        constraints.append(loginSuccessMessageLabel.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(loginSuccessImageView.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[loginSuccessMessageLabel]-(verticalPadding)-[loginSuccessImageView]",
                                                                      options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
    }

}
