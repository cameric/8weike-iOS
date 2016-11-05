//
//  resetPasswordView.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(30)

protocol ResetPasswordViewDelegate: class {
    func confirmButtonTapped()
}

class ResetPasswordView: UIView {
    
    // MARK: Properties
    
    weak var delegate: ResetPasswordViewDelegate?
    var password: String? { get { return passwordTextField.text } }
    var confirmPassword: String? { get { return passwordTextField.text } }
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
    fileprivate let passwordTextField = UITextField.floatLabeled
    fileprivate let confirmPasswordTextField = UITextField.floatLabeled
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([titleLabel, passwordTextField, confirmPasswordTextField])
        formManager.addTextFields([passwordTextField, confirmPasswordTextField])
        installConstraints()
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        backgroundColor = UIColor.background
        
        // Configure title
        titleLabel.text = "Change Password".localized()
        titleLabel.font = .extraExtraLargeBold
        titleLabel.textColor = .white
        
        // Configure passwordTextField
        passwordTextField.placeholder = "New Password".localized()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.minimumNumberOfCharacters = 8
        passwordTextField.messageRequired = "The password should be 8 characters long".localized()
        passwordTextField.messageInvalid = "Password invalid".localized()
        passwordTextField.formKeyPath = "password"
        passwordTextField.accessibilityIdentifier = "Password"
        passwordTextField.returnKeyType = .next
        
        // Configure confirmPasswordTextField
        confirmPasswordTextField.placeholder = "Confirm Password".localized()
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.minimumNumberOfCharacters = passwordTextField.minimumNumberOfCharacters
        confirmPasswordTextField.validateBlock = { (textfield) -> Bool in
            return self.passwordTextField.text == textfield?.text
        }
        confirmPasswordTextField.messageRequired = "Please re-enter your password".localized()
        confirmPasswordTextField.messageInvalid = "Passwords don't match".localized()
        confirmPasswordTextField.formKeyPath = "password_confirm"
        confirmPasswordTextField.accessibilityIdentifier = "PasswordConfirm"
        confirmPasswordTextField.returnKeyType = .send
        confirmPasswordTextField.delegate = self
        
    }
    
    private func installConstraints() {
        let views = ["titleLabel": titleLabel,
                     "passwordTextField": passwordTextField,
                     "confirmPasswordTextField": confirmPasswordTextField]
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
            "H:|-(horizontalPadding)-[passwordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[confirmPasswordTextField]-(horizontalPadding)-|",
                                                                      options: [], metrics: metrics, views: views))
        
        // Vertical constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(verticalPadding)-[titleLabel]-(verticalPadding)-[passwordTextField]-(verticalPadding)-[confirmPasswordTextField]",
                                                                      options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    // MARK: Helper
    func confirmButtonTapped() {
        delegate?.confirmButtonTapped()
    }
    
}

// MARK: UITextFieldDelegate

extension ResetPasswordView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .send {
            delegate?.confirmButtonTapped()
            return true
        }
        return false
    }
}

// MARK: Keyboard Dismiss

extension ResetPasswordView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        formManager.activeField?.resignFirstResponder()
    }
}
