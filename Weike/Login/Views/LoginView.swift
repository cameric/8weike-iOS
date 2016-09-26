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
    var phone: String? { get { return phoneNumberTextField.text } }
    var password: String? { get { return passwordTextField.text } }
    private var formManager = UITextField.formManager

    // MARK: Views

    fileprivate let phoneNumberTextField = UITextField.floatLabeled
    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let loginButton = UIButton.rounded
    fileprivate let forgetPassword = UIButton(type: .system)

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([phoneNumberTextField, passwordTextField, loginButton, forgetPassword])
        formManager.addTextFields([phoneNumberTextField, passwordTextField])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        // Configure phoneNumberTextField
        phoneNumberTextField.placeholder = "Phone Number".localized()
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.regex = "^(\\+?0?86\\-?)?1[345789]\\d{9}$"
        phoneNumberTextField.messageInvalid = "Your phone number is not a valid".localized()
        phoneNumberTextField.messageRequired = "Please enter a phone number".localized()
        phoneNumberTextField.formKeyPath = "phone"

        // Configure passwordTextField
        passwordTextField.placeholder = "Password".localized()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.minimumNumberOfCharacters = 8
        passwordTextField.messageRequired = "The password should be 8 characters long".localized()
        passwordTextField.messageInvalid = "Password invalid".localized()
        passwordTextField.formKeyPath = "password"

        // Configure loginButton
        loginButton.setTitle("Login".localized(), for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

       // Configure forgetPassword
        forgetPassword.setTitle("Forget Password?".localized(), for: [])
        forgetPassword.setTitleColor(UIColor.main, for: [])
        forgetPassword.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views = ["phoneNumberTextField": phoneNumberTextField,
                     "passwordTextField": passwordTextField,
                     "loginButton": loginButton,
                     "forgetPassword": forgetPassword]
        let metrics = ["horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[phoneNumberTextField]-(horizontalPadding)-|",
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
            "V:|-(verticalPadding)-[phoneNumberTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[loginButton]-[forgetPassword]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Private Helpers

    func loginButtonTapped(event: UIEvent) {
        let isValid = formManager.checkForm()
        if isValid {
            delegate?.loginButtonTapped()
        }
    }

    func forgetPasswordTapped(event: UIEvent) {
        delegate?.forgetPasswordTapped()
    }
}
