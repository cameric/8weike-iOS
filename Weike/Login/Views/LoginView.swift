//
//  LoginView.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(30)

protocol LoginViewDelegate: class {
    func loginButtonTapped()
    func forgetPasswordTapped()
    func signUpButtonTapped()
}

class LoginView: UIView {

    // MARK: Properties

    weak var delegate: LoginViewDelegate?
    var phone: String? { get { return phoneNumberTextField.text } }
    var password: String? { get { return passwordTextField.text } }
    var formManager = UITextField.formManager

    fileprivate var topConstraint = NSLayoutConstraint()
    var topPadding = CGFloat(80) {
        didSet {
            topConstraint.constant = topPadding
            layoutIfNeeded()
        }
    }
    
    // MARK: Views
    
    fileprivate let titleLabel = UILabel()
    fileprivate let phoneNumberTextField = UITextField.floatLabeled
    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let forgetPasswordButton = UIButton()
    fileprivate let signUpLabel = UILabel()
    fileprivate let signUpButton = UIButton()

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([titleLabel, phoneNumberTextField, passwordTextField, forgetPasswordButton, signUpLabel, signUpButton])
        formManager.addTextFields([phoneNumberTextField, passwordTextField])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background

        // Configure title
        titleLabel.text = "Login".localized()
        titleLabel.font = .extraExtraLargeBold
        titleLabel.textColor = .white
        
        // Configure phoneNumberTextField
        phoneNumberTextField.placeholder = "Phone Number".localized()
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.regex = "^(\\+?0?86\\-?)?1[345789]\\d{9}$"
        phoneNumberTextField.messageInvalid = "Your phone number is not a valid".localized()
        phoneNumberTextField.messageRequired = "Sorry, please enter numbers only".localized()
        phoneNumberTextField.formKeyPath = "Phone"
        phoneNumberTextField.accessibilityIdentifier = "Phone"
        phoneNumberTextField.returnKeyType = .next

        // Configure passwordTextField
        passwordTextField.placeholder = "Password".localized()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.minimumNumberOfCharacters = 8
        passwordTextField.messageRequired = "The password should be 8 characters long".localized()
        passwordTextField.messageInvalid = "Password invalid".localized()
        passwordTextField.formKeyPath = "password"
        passwordTextField.accessibilityIdentifier = "Password"
        passwordTextField.returnKeyType = .send
        
        // Configure forgotPasswordButton
        let attributes = [
            NSFontAttributeName: UIFont.normal,
            NSForegroundColorAttributeName: UIColor.white,
            NSUnderlineStyleAttributeName: 1
        ] as [String : Any]?
        let forgetPasswordString = NSAttributedString(string: "Forget Password", attributes: attributes)
        forgetPasswordButton.setAttributedTitle(forgetPasswordString, for: .normal)
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
        
        // Configure signUpButton
        let signUpString = NSAttributedString(string: "Sign Up", attributes: attributes)
        signUpButton.setAttributedTitle(signUpString, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        // Configure signUpLabel
        signUpLabel.text = "Don't have an account?".localized()
        signUpLabel.textColor = .white
        signUpLabel.font = .normal
        
    }

    private func installConstraints() {
        let views = ["titleLabel": titleLabel,
                     "phoneNumberTextField": phoneNumberTextField,
                     "passwordTextField": passwordTextField,
                     "forgetPasswordButton": forgetPasswordButton,
                     "signUpLabel": signUpLabel,
                     "signUpButton": signUpButton]
        let metrics = ["topPadding": topPadding,
                       "horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[titleLabel]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[phoneNumberTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[passwordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[forgetPasswordButton]",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[signUpLabel]-[signUpButton]",
                                                                      options: [], metrics: metrics, views: views))

        // Vertical constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[titleLabel]-(verticalPadding)-[phoneNumberTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[forgetPasswordButton]-[signUpLabel]",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[titleLabel]-(verticalPadding)-[phoneNumberTextField]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[forgetPasswordButton]-[signUpButton]",
                                                                      options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
        signUpLabel.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor).isActive = true
    }
    
    // MARK: Helpers

    func forgetPasswordTapped() {
        delegate?.forgetPasswordTapped()
    }
    
    func signUpButtonTapped() {
        delegate?.signUpButtonTapped()
    }
}

// MARK: UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .send {
            delegate?.loginButtonTapped()
            return true
        }
        return false
    }
}

// MARK: Keyboard Dismiss

extension LoginView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        formManager.activeField?.resignFirstResponder()
    }
}
