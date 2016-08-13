//
//  LoginView.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(20)

class LoginView: UIView {
    // MARK: Views

    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let forgetPassword = UIButton()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([userNameTextField, passwordTextField, loginButton, forgetPassword])
        installConstraints()
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        backgroundColor = UIColor.main()
        
        userNameTextField.placeholder = "Username/Phone Number"
        passwordTextField.placeholder = "Password"
        loginButton.setTitle("Login", for: [])
        forgetPassword.setTitle("Forget Password?", for: [])
    }
    
    private func installConstraints() {
        let views = ["userNameTextField": userNameTextField,
                     "passwordTextField": passwordTextField,
                     "loginButton": loginButton,
                     "forgetPassword": forgetPassword]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()
        
        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[userNameTextField]-(horizontalPadding)-|",
            options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[passwordTextField]-(horizontalPadding)-|",
            options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[loginButton]-(horizontalPadding)-|",
            options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[forgetPassword]-(horizontalPadding)-|",
            options: [], metrics: metrics, views: views))
        
        // Vertical constraints
        constraints.append(passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[userNameTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[loginButton]-(verticalPadding)-[forgetPassword]",
            options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
