//
//  LoginView.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(80)
private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)

protocol LoginViewDelegate: class {
    func loginButtonTapped()
    func forgetPasswordTapped()
}

class LoginView: UIView {
    // MARK: Properties

    weak var delegate: LoginViewDelegate?
    private var verticalAnchor: NSLayoutConstraint?

    // MARK: Views

    private let userNameTextField = UITextField.floatLabeled
    private let passwordTextField = UITextField.floatLabeled
    private let loginButton = UIButton.rounded
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
        backgroundColor = UIColor.background
        startListenToKeyboardEvent()

        userNameTextField.setPlaceholder("Phone Number", floatingTitle: "Phone Number")

        passwordTextField.setPlaceholder("Password", floatingTitle: "Password")

        loginButton.setTitle("Login", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        forgetPassword.setTitle("Forget Password?", for: [])
        forgetPassword.setTitleColor(UIColor.main, for: [])
        forgetPassword.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
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
            "H:[forgetPassword]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))

        // Vertical constraints
        verticalAnchor = passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        constraints.append(verticalAnchor!)
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:[userNameTextField]-[passwordTextField]-(verticalPadding)-[loginButton]-[forgetPassword]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Private Helpers

    func loginButtonTapped(event: UIEvent) {
        delegate?.loginButtonTapped()
    }

    func forgetPasswordTapped(event: UIEvent) {
        delegate?.forgetPasswordTapped()
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
