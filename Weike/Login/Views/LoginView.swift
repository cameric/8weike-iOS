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

    // MARK: Views

    fileprivate let phoneTextField = UITextField.floatLabeled
    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let loginButton = UIButton.rounded
    fileprivate let forgetPassword = UIButton(type: .system)

    var phone: String? { get { return phoneTextField.text } }
    var password: String? { get { return passwordTextField.text } }

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([phoneTextField, passwordTextField, loginButton, forgetPassword])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        phoneTextField.setPlaceholder("Phone Number", floatingTitle: "Phone Number")
        phoneTextField.keyboardType = .phonePad

        passwordTextField.setPlaceholder("Password", floatingTitle: "Password")
        passwordTextField.isSecureTextEntry = true

        loginButton.setTitle("Login", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        forgetPassword.setTitle("Forget Password?", for: [])
        forgetPassword.setTitleColor(UIColor.main, for: [])
        forgetPassword.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views = ["phoneTextField": phoneTextField,
                     "passwordTextField": passwordTextField,
                     "loginButton": loginButton,
                     "forgetPassword": forgetPassword]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[phoneTextField]-(horizontalPadding)-|",
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
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[phoneTextField]-[passwordTextField]-(verticalPadding)-[loginButton]-[forgetPassword]",
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
