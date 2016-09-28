//
//  SignupView.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let topPadding = CGFloat(80)
private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(30)

protocol SignupViewDelegate: class {
    func signupButtonTapped()
}

final class SignupView: UIView {

    // MARK: Properties

    weak var delegate: SignupViewDelegate?
    var phone: String? { return phoneNumberTextField.text }
    var password: String? { return passwordTextField.text }
    var formManager = UITextField.formManager

    // MARK: Views

    fileprivate let titleLabel = UILabel()
    fileprivate let phoneNumberTextField = UITextField.floatLabeled
    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let confirmPasswordTextField = UITextField.floatLabeled
    fileprivate let signupButton = UIButton.rounded

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([titleLabel, phoneNumberTextField, passwordTextField, confirmPasswordTextField, signupButton])
        formManager.addTextFields([phoneNumberTextField, passwordTextField, confirmPasswordTextField])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        titleLabel.text = "Sign Up".localized()
        titleLabel.font = .extraExtraLargeBold
        titleLabel.textColor = .white

        // Configure phoneNumberTextField
        phoneNumberTextField.placeholder = "Phone Number".localized()
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.regex = "^(\\+?0?86\\-?)?1[345789]\\d{9}$"
        phoneNumberTextField.messageInvalid = "Your phone number is not a valid".localized()
        phoneNumberTextField.messageRequired = "Please enter a phone number".localized()
        phoneNumberTextField.formKeyPath = "phone"
        phoneNumberTextField.returnKeyType = .next

        // Configure passwordTextField
        passwordTextField.placeholder = "Password".localized()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.minimumNumberOfCharacters = 8
        passwordTextField.messageRequired = "The password should be 8 characters long".localized()
        passwordTextField.messageInvalid = "Password invalid".localized()
        passwordTextField.formKeyPath = "password"
        passwordTextField.returnKeyType = .next

        // Configure confirmPasswordTextField
        confirmPasswordTextField.placeholder = "Confirm Password".localized()
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.minimumNumberOfCharacters = passwordTextField.minimumNumberOfCharacters
        confirmPasswordTextField.validateBlock = { (textfield) -> Bool in
            return self.passwordTextField.text == textfield?.text
        }
        confirmPasswordTextField.messageRequired = "Please re-enter your password".localized()
        confirmPasswordTextField.messageInvalid = "Passwords not match".localized()
        confirmPasswordTextField.formKeyPath = "password2"
        confirmPasswordTextField.returnKeyType = .send
        confirmPasswordTextField.delegate = self

        // Configure signupButton
        signupButton.setTitle("Sign Up".localized(), for: [])
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }

    private func installConstraints() {
        let views = ["titleLabel": titleLabel,
                     "phoneNumberTextField": phoneNumberTextField,
                     "passwordTextField": passwordTextField,
                     "confirmPasswordTextField": confirmPasswordTextField,
                     "signupButton": signupButton]
        let metrics = ["topPadding": topPadding,
                       "horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[titleLabel]|",
                                                                      options: [], metrics: metrics, views: views))
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
            "H:|-(horizontalPadding)-[signupButton]",
                                                                      options: [], metrics: metrics, views: views))

        // Vertical constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(topPadding)-[titleLabel]-(verticalPadding)-[phoneNumberTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[confirmPasswordTextField]-(verticalPadding)-[signupButton]",
                                                                      options: [], metrics: metrics, views: views))

        NSLayoutConstraint.activate(constraints)
    }

    // MARK: Private Helpers

    func signupButtonTapped(event: UIEvent) {
        delegate?.signupButtonTapped()
    }
}

// MARK: UITextFieldDelegate

extension SignupView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .send {
            delegate?.signupButtonTapped()
            return true
        }
        return false
    }
}

// MARK: Keyboard Dismiss

extension SignupView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        formManager.activeField?.resignFirstResponder()
    }
}
