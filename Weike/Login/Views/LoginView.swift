//
//  LoginView.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(50)
private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(20)

class LoginView: UIView {
    // MARK: Properties
    
    private var verticalAnchor: NSLayoutConstraint?
    
    // MARK: Views
    
    private let userNameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton.whiteBorderTransparent(withTitle: "Login")
    private let forgetPassword = UIButton(type: .system)
    
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
        startListenToKeyboardEvent()
        
        userNameTextField.placeholder = "Username/Phone Number"
        passwordTextField.placeholder = "Password"
        forgetPassword.setTitle("Forget Password?", for: [])
        loginButton.addTarget(self, action: #selector(LoginViewController.loginButtonPressed(sender:)), for: .touchUpInside)
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
        verticalAnchor = passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        constraints.append(verticalAnchor!)
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[userNameTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[loginButton]-(verticalPadding)-[forgetPassword]",
                                                                      options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: KeyboardDelegate

extension LoginView: KeyboardDelegate {
    func keyboardWillShow() {
        if verticalAnchor != nil {
            NSLayoutConstraint.deactivate([verticalAnchor!])
        }
        
        verticalAnchor = userNameTextField.topAnchor.constraint(equalTo: topAnchor,
                                                                constant: topPadding)
        NSLayoutConstraint.activate([verticalAnchor!])
        
        setNeedsLayout()
    }
    
    func keyboardWillHide() {
        if verticalAnchor != nil {
            NSLayoutConstraint.deactivate([verticalAnchor!])
        }
        
        verticalAnchor = passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([verticalAnchor!])
        
        setNeedsLayout()
    }
}
