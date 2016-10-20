//
//  SignupUsernameView.swift
//  Weike
//
//  Created by Cam on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

private let horizontalPadding = CGFloat(30)
private let verticalPadding = CGFloat(30)

protocol SignupUsernameViewDelegate: class {
    func confirmUsernameButtonTapped()
}

class SignupUsernameView: UIView {

    // MARK: Properties
    var formManager = UITextField.formManager
    weak var delegate: SignupUsernameViewDelegate?
    var username: String? { return usernameTextField.text }
    
    fileprivate var topConstraint = NSLayoutConstraint()
    var topPadding = CGFloat(80) {
        didSet {
            topConstraint.constant = topPadding
            layoutIfNeeded()
        }
    }
    
    // MARK: Views
    fileprivate let titleLabel = UILabel()
    fileprivate let usernameTextField = UITextField.floatLabeled
    fileprivate let confirmUsernameButton = UIButton.rounded
    

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        addSubviews([titleLabel, usernameTextField, confirmUsernameButton])
        formManager.addTextFields([usernameTextField])
        installConstraints()
    }

    convenience required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        backgroundColor = UIColor.background
        
        titleLabel.text = "Sign Up Username".localized()
        titleLabel.font = .extraExtraLargeBold
        titleLabel.textColor = .white

        // Configure phoneNumberTextField
        usernameTextField.placeholder = "Username".localized()
        usernameTextField.minimumNumberOfCharacters = 3
        usernameTextField.messageInvalid = "Your username is not a valid".localized()
        usernameTextField.messageRequired = "What is your nickname?".localized()

        confirmUsernameButton.setTitle("Confirm Username".localized(), for: [])
    }

    private func installConstraints() {
        let views = ["titleLabel": titleLabel,
                     "usernameTextField": usernameTextField,
                     "confirmUsernameButton": confirmUsernameButton]
        let metrics = ["topPadding": topPadding,
                       "horizontalPadding": horizontalPadding,
                       "verticalPadding": verticalPadding]
        disableTranslatesAutoresizingMaskIntoConstraints(views)
        var constraints = [NSLayoutConstraint]()

        // Horizontal Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[titleLabel]|",
                                                                      options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[usernameTextField]-(horizontalPadding)-|", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "H:|-(horizontalPadding)-[confirmUsernameButton]|", options: [], metrics: metrics, views: views))

        // Vertical Constraints
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:
            "V:|-(topPadding)-[titleLabel]-(verticalPadding)-[usernameTextField]-(verticalPadding)-[confirmUsernameButton]",
            options: [], metrics: metrics, views: views))
        topConstraint = titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: topPadding)
        constraints.append(topConstraint)
        
        NSLayoutConstraint.activate(constraints)
    }
}
    // Private Helpers

    extension SignupUsernameView: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField.returnKeyType == .send {
                delegate?.confirmUsernameButtonTapped()
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
