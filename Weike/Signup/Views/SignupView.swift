//
//  SignupView.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(80)
private let horizontalPadding = CGFloat(20)
private let verticalPadding = CGFloat(20)
private let textFieldFloatAdjustment = CGFloat(-15)

protocol SignupViewDelegate: class {
    func signupButtonTapped()
}

class SignupView: UIView {

    // MARK: Properties

    weak var delegate: SignupViewDelegate?
    var phone: String? { return phoneNumberTextField.text }
    var password: String? { return passwordTextField.text }
    private var formManager = UITextField.formManager

    // MARK: Views

    fileprivate let phoneNumberTextField = UITextField.floatLabeled
    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let confirmPasswordTextField = UITextField.floatLabeled
    fileprivate let signupButton = UIButton.rounded

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([phoneNumberTextField, passwordTextField, confirmPasswordTextField, signupButton])
        formManager.addTextFields([phoneNumberTextField, passwordTextField, confirmPasswordTextField])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        // Configure phoneNumberTextField
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.floatingLabelYPadding = textFieldFloatAdjustment
        phoneNumberTextField.regex = "^(\\+?0?86\\-?)?1[345789]\\d{9}$"
        phoneNumberTextField.messageInvalid = "Your phone number is not a valid"
        phoneNumberTextField.messageRequired = "Please enter a phone number"
        phoneNumberTextField.formKeyPath = "phone"

        // Configure passwordTextField
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.floatingLabelYPadding = textFieldFloatAdjustment
        passwordTextField.minimumNumberOfCharacters = 8
        passwordTextField.messageRequired = "The password should be 8 characters long"
        passwordTextField.messageInvalid = "Password invalid"
        passwordTextField.formKeyPath = "password"

        // Configure confirmPasswordTextField
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.floatingLabelYPadding = textFieldFloatAdjustment
        confirmPasswordTextField.minimumNumberOfCharacters = passwordTextField.minimumNumberOfCharacters
        confirmPasswordTextField.validateBlock = { (textfield) -> Bool in
            return self.passwordTextField.text == textfield?.text
        }
        confirmPasswordTextField.messageRequired = "Please re-enter your password"
        confirmPasswordTextField.messageInvalid = "Passwords not match"
        confirmPasswordTextField.formKeyPath = "password2"

        // Configure signupButton
        signupButton.setTitle("Sign Up", for: [])
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views = ["phoneNumberTextField": phoneNumberTextField,
                     "passwordTextField": passwordTextField,
                     "confirmPasswordTextField": confirmPasswordTextField,
                     "signupButton": signupButton]
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
            "H:|-(horizontalPadding)-[confirmPasswordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[signupButton]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))

        // Vertical constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[phoneNumberTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[confirmPasswordTextField]-(verticalPadding)-[signupButton]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Private Helpers

    func signupButtonTapped(event: UIEvent) {
        let isValid = formManager.checkForm()
        if isValid {
            delegate?.signupButtonTapped()
        }
    }
}
